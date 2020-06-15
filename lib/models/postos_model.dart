import 'dart:ffi';

class Postos {
  String nome;
  String municipio;
  String uf;
  String rodovia;
  double km;
  double avaliacao;
  double latitude;
  double longitude;
  int ppd;

  Postos({
    this.nome,
    this.municipio,
    this.uf,
    this.rodovia,
    this.km,
    this.avaliacao,
    this.latitude,
    this.longitude,
    this.ppd,
  });
}

final List<Postos> postos = [
  Postos(
    avaliacao: 4.0,
    nome: 'POSTO SOL DA DUTRA',
    municipio: 'Barra Mansa',
    uf: 'RJ',
    rodovia: 'BR116',
    km: 290.0,
    latitude: -22.5604362,
    longitude: -44.1435899,
    ppd: 1,
  ),
  Postos(
      avaliacao: 3.9,
      nome: 'POSTO SOL DA DUTRA',
      municipio: 'Porto Real',
      uf: 'RJ',
      rodovia: 'BR116',
      km: 296.0,
      latitude: -22.4518451,
      longitude: -44.3607362,
      ppd: 1),
  Postos(
    avaliacao: 3.9,
    nome: 'POSTO SOL DA DUTRA',
    municipio: 'Resende',
    uf: 'RJ',
    rodovia: 'BR116',
    km: 304.0,
    latitude: -22.4588693,
    longitude: -44.4431528,
    ppd: 1,
  ),
  Postos(
    avaliacao: 2.0,
    nome: 'POSTO SOL DA DUTRA',
    municipio: 'Resende',
    uf: 'RJ',
    rodovia: 'BR116',
    km: 304.0,
    latitude: -22.4588693,
    longitude: -44.4431528,
    ppd: 1,
  ),
  Postos(
    avaliacao: 3.0,
    nome: 'Posto Barnabes',
    municipio: 'Juquitiba',
    uf: 'SP',
    rodovia: 'BR116',
    km: 337.0,
    latitude: -23.9897745,
    longitude: -47.1447434,
    ppd: 0,
  ),
  Postos(
    avaliacao: 4.2,
    nome: 'Posto Serras',
    municipio: 'Miracatu',
    uf: 'SP',
    rodovia: 'BR116',
    km: 345.3,
    latitude: -24.0380478,
    longitude: -47.1916499,
    ppd: 0,
  ),
];
