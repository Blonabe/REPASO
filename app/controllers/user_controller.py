from flask import Blueprint, render_template, request, redirect, url_for, current_app
from flask_bcrypt import Bcrypt
from flask import session

user_bp = Blueprint('user_bp', __name__)
bcrypt = Bcrypt()

@user_bp.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        connection = current_app.connection
        try:
            with connection.cursor() as cursor:
                cursor.execute("SELECT password FROM usuarios WHERE email=%s", (email,))
                result = cursor.fetchone()
                if result and bcrypt.check_password_hash(result['password'], password):
                    session['user_email'] = email 
                    return redirect(url_for('user_bp.profile'))
                else:
                    return "Login Failed"
        except Exception as e:
            return str(e)

    return render_template('login.html')

@user_bp.route('/Registro', methods=['GET', 'POST'])
def Registro():
    connection = current_app.connection
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        role_id = request.form['role']
        hashed_password = bcrypt.generate_password_hash(password).decode('utf-8')

        try:
            with connection.cursor() as cursor:
                cursor.execute("INSERT INTO usuarios (email, password, role_id) VALUES (%s, %s, %s)", (email, hashed_password, role_id))
                connection.commit()
            return redirect(url_for('user_bp.login'))
        except Exception as e:
            return str(e)

    try:
        with connection.cursor() as cursor:
            cursor.execute("SELECT id, role_name FROM roles")
            roles = cursor.fetchall()
    except Exception as e:
        return str(e)

    return render_template('registro.html', roles=roles)


