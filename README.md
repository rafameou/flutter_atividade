# flutter_atividade

Clone de aplicativo estilo Linkedin.

# Grupo

- Rafael D. Mazzutti
- Álex Wladyka
- Vytor Hugo

# Instalação

Crie um arquivo `.env` (no mesmo lugar onde este README está) com `DEEPL_API=..."`, após isso rode `dart run build_runner build` para construir a database e .env

Projeto está setado para Linux por padrão, lembre-se de mudar para android usando `flutter devices` e depois execute com `flutter run`.

Database fica guardado na pasta de documentos.

# BUGS

* DialogBox na tela de esqueceu a senha (forgot_password.dart) não funciona;
* Checar TODO.

# TODO

* Feedback/Validações (Parcial?);
* DB;
    * Arrumar tela de opções, colocar pra mudar;
    * Remover relação de usuario tendo posts;
    * Remover relação de posts tendo comentarios, mudar pra pai?
* Comentários;
    * Diferenciação entre posts comuns e comentários;
        * Checar se bool é melhor;;;
* Melhorar tela de login;
    * Aumentar padding;
    * Escolher um logo para o projeto;
    * Centralizar;
* Menções?