import 'dart:io';
import 'models/livro.dart';
import 'services/biblioteca.dart';

void main() {
  final biblioteca = Biblioteca();
  int opcao = 0;

  do {
    print("\n=== SISTEMA DE BIBLIOTECA ===");
    print("1 - Cadastrar livro");
    print("2 - Listar livros");
    print("3 - Atualizar livro");
    print("4 - Remover livro");
    print("5 - Sair");

    stdout.write("Escolha uma opção: ");
    opcao = int.tryParse(stdin.readLineSync()!) ?? 0;

    switch (opcao) {
      case 1:
        cadastrarLivro(biblioteca);
        break;
      case 2:
        biblioteca.listar();
        break;
      case 3:
        atualizarLivro(biblioteca);
        break;
      case 4:
        removerLivro(biblioteca);
        break;
      case 5:
        print("Saindo...");
        break;
      default:
        print("Opção inválida!");
    }
  } while (opcao != 5);
}

void cadastrarLivro(Biblioteca biblioteca) {
  stdout.write("ID: ");
  String id = stdin.readLineSync()!;

  stdout.write("Título: ");
  String titulo = stdin.readLineSync()!;

  stdout.write("Autor: ");
  String autor = stdin.readLineSync()!;

  stdout.write("Ano: ");
  int ano = int.tryParse(stdin.readLineSync()!) ?? 0;

  biblioteca.cadastrar(
    Livro(id: id, titulo: titulo, autor: autor, ano: ano),
  );
}

void atualizarLivro(Biblioteca biblioteca) {
  stdout.write("Digite o ID do livro: ");
  String id = stdin.readLineSync()!;

  stdout.write("Novo título: ");
  String titulo = stdin.readLineSync()!;

  stdout.write("Novo autor: ");
  String autor = stdin.readLineSync()!;

  stdout.write("Novo ano: ");
  int ano = int.tryParse(stdin.readLineSync()!) ?? 0;

  biblioteca.atualizar(id, titulo, autor, ano);
}

void removerLivro(Biblioteca biblioteca) {
  stdout.write("Digite o ID do livro: ");
  String id = stdin.readLineSync()!;

  biblioteca.remover(id);
}
