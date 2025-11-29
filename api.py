from flask import Flask, request, jsonify
import mysql.connector

app = Flask(__name__)

# --------------------------------------------------
# CONEXÃO COM MYSQL
# --------------------------------------------------
def conectar():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",  # sua senha aqui
        database="supermercadosa",
        port=3306
    )

# TESTAR CONEXÃO ANTES DE INICIAR SERVIDOR
try:
    db = conectar()
    print("Conectado com sucesso ao MySQL!")
    db.close()
except Exception as e:
    print("Erro ao conectar:", e)


# --------------------------------------------------
# ROTA DE LOGIN
# --------------------------------------------------
@app.post("/login")
def login():
    dados = request.json
    usuario = dados["usuario"]
    senha = dados["senha"]

    db = conectar()
    cursor = db.cursor(dictionary=True)

    cursor.execute("""
        SELECT * FROM usuarios 
        WHERE usuario = %s AND senha = %s
    """, (usuario, senha))

    user = cursor.fetchone()
    cursor.close()
    db.close()

    if user:
        return jsonify({"success": True, "usuario": user})
    else:
        return jsonify({"success": False, "mensagem": "Login inválido"})


# --------------------------------------------------
# LISTAR PRODUTOS
# --------------------------------------------------
@app.get("/produtos")
def listar_produtos():
    db = conectar()
    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT * FROM produtos")
    produtos = cursor.fetchall()

    cursor.close()
    db.close()

    return jsonify(produtos)


# --------------------------------------------------
# CADASTRAR PRODUTO
# --------------------------------------------------
@app.post("/produto")
def cadastrar_produto():
    dados = request.json
    nome = dados["nome"]
    categoria = dados["categoria"]
    preco = dados["preco"]
    estoque = dados["estoque"]

    db = conectar()
    cursor = db.cursor()

    cursor.execute("""
        INSERT INTO produtos (nome, categoria, preco, estoque)
        VALUES (%s, %s, %s, %s)
    """, (nome, categoria, preco, estoque))

    db.commit()
    cursor.close()
    db.close()

    return jsonify({"success": True, "mensagem": "Produto cadastrado!"})


# --------------------------------------------------
# BUSCAR PRODUTO POR ID
# --------------------------------------------------
@app.get("/produto/<int:produto_id>")
def buscar_produto(produto_id):
    db = conectar()
    cursor = db.cursor(dictionary=True)

    cursor.execute("SELECT * FROM produtos WHERE id = %s", (produto_id,))
    produto = cursor.fetchone()

    cursor.close()
    db.close()

    if produto:
        return jsonify(produto)
    else:
        return jsonify({"success": False, "mensagem": "Produto não encontrado"})


# --------------------------------------------------
# INICIAR SERVIDOR
# --------------------------------------------------
if __name__ == "__main__":
    print("API rodando em http://localhost:5000")
    app.run(debug=True)
