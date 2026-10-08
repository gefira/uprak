import 'dart:io';

class BankAccount {
  double _saldo = 0;
  int deposit_saldo = 0;
  int ambil_saldo = 0;

  void deposit(int jumlah) {
    _saldo += jumlah;
    print("Saldo bertambah menjadi: $_saldo");
  }

  void withdraw(int jumlah) {
    if (jumlah <= _saldo) {
      _saldo -= jumlah;
      print("Berhasil menarik $jumlah. Saldo sekarang: $_saldo");
    } else {
      print("Saldo tidak cukup!");
    }
  }

  double getSaldo() {
    return _saldo;
  }
}

void main() {
  var rekening = BankAccount();

  stdout.write("Input saldo yang akan disimpan : ");
  rekening.deposit_saldo = int.parse(stdin.readLineSync()!);

  rekening.deposit(rekening.deposit_saldo);

  stdout.write("Input saldo yang akan diambil : ");
  rekening.ambil_saldo = int.parse(stdin.readLineSync()!);

  rekening.withdraw(rekening.ambil_saldo);
}