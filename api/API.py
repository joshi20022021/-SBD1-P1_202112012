from flask import Flask, request, jsonify, session
import cx_Oracle
import bcrypt
from CARGAS.db_connection import get_connection  

app = Flask(__name__)

@app.route('/api/users', methods=['POST'])
@app.route('/api/users/login', methods=['POST'])
def create_user():
    try:
        data = request.json

        required_fields = ["identificacion", "nombre", "apellido", "telefono", "email", "password"]
        if not all(field in data for field in required_fields):
            return jsonify({"status": "error", "message": "Datos incompletos"}), 400

        hashed_password = bcrypt.hashpw(data["password"].encode("utf-8"), bcrypt.gensalt()).decode("utf-8")

        conn = get_connection()
        cursor = conn.cursor()

        insert_query = """
            INSERT INTO Usuarios (Id_Usuario, Identificacion_Nacional, Nombre, Apellido, Telefono, Email, Contraseña, Activo, Correo_Confirmado, created_at, updated_at)
            VALUES (usuario_seq.NEXTVAL, :1, :2, :3, :4, :5, :6, :7, :8, SYSTIMESTAMP, SYSTIMESTAMP)
        """

        cursor.execute(insert_query, (
            data["identificacion"],
            data["nombre"],
            data["apellido"],
            data["telefono"],
            data["email"],
            hashed_password,
            data.get("activo", 1),
            data.get("correo_confirmado", 0)  
        ))

        conn.commit()
        cursor.close()
        conn.close()

        return jsonify({"status": "success", "message": "Usuario creado correctamente"}), 201

    except cx_Oracle.DatabaseError as e:
        return jsonify({"status": "error", "message": "Error en la base de datos", "details": str(e)}), 500

    except Exception as e:
        return jsonify({"status": "error", "message": "Error interno", "details": str(e)}), 500


def login():
    try:
        data = request.json

        if not data.get("username") or not data.get("password"):
            return jsonify({"status": "error", "message": "Faltan datos"}), 400

        conn = get_connection()
        cursor = conn.cursor()

        cursor.execute("SELECT Id_Usuario, Email, Contraseña FROM Usuarios WHERE Email = :1", (data["username"],))
        user = cursor.fetchone()

        if not user:
            return jsonify({"status": "error", "message": "Usuario no encontrado"}), 401

        user_id, email, hashed_password = user

        if not bcrypt.checkpw(data["password"].encode("utf-8"), hashed_password.encode("utf-8")):
            return jsonify({"status": "error", "message": "Contraseña incorrecta"}), 401

        session_id = str(user_id) + "_session"
        session["user_id"] = user_id

        return jsonify({"status": "success", "message": "User authenticated", "sessionId": session_id}), 200

    except cx_Oracle.DatabaseError as e:
        return jsonify({"status": "error", "message": "Error en la base de datos", "details": str(e)}), 500

    except Exception as e:
        return jsonify({"status": "error", "message": "Error interno", "details": str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
