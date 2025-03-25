import 'dart:io';

class Pessoa {
  String nome;
  double peso;
  double altura;

  Pessoa({required this.nome, required this.peso, required this.altura});

  double calcularIMC() {
    return peso / (altura * altura);
  }

  String classificarIMC() {
    double imc = calcularIMC();
    if (imc < 18.5) {
      return "Abaixo do peso";
    } else if (imc < 25) {
      return "Peso ideal";
    } else if (imc < 30) {
      return "Sobrepeso";
    } else if (imc < 35) {
      return "Obesidade Grau I";
    } else if (imc < 40) {
      return "Obesidade Grau II";
    } else {
      return "Obesidade Grau III";
    }
  }
}

void main() {
  try {
    stdout.write("Digite seu nome: ");
    String? nome = stdin.readLineSync();

    stdout.write("Digite seu peso (kg): ");
    String? pesoInput = stdin.readLineSync();
    double peso = double.parse(pesoInput ?? '');

    stdout.write("Digite sua altura (m): ");
    String? alturaInput = stdin.readLineSync();
    double altura = double.parse(alturaInput ?? '');

    Pessoa pessoa = Pessoa(nome: nome ?? '', peso: peso, altura: altura);

    double imc = pessoa.calcularIMC();
    String classificacao = pessoa.classificarIMC();

    print("\n👤 Nome: ${pessoa.nome}");
    print("📏 Altura: ${pessoa.altura} m");
    print("⚖️ Peso: ${pessoa.peso} kg");
    print("📊 IMC: ${imc.toStringAsFixed(2)}");
    print("📌 Classificação: $classificacao");
  } catch (e) {
    print(
      "\n❗ Erro: Entrada inválida. Certifique-se de digitar números válidos para peso e altura.",
    );
  }
}
