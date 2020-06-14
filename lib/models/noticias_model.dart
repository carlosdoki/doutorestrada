class Noticias {
  String url;
  String nome;
  String texto;

  Noticias({
    this.url,
    this.nome,
    this.texto,
  });
}

final List<Noticias> noticias = [
  Noticias(
      url:
          'http://www.spvias.com.br/resources/media/banner/original/20200508_1ec7633e65d84e5aa75ab942a0c85e91_dc16a07b408746ecbafa91f497c2def6.png',
      nome: 'Cia da Consulta',
      texto:
          'Caminhoneiro, cuide de sua saúde. Não deixe sua saúde de lado. Pensando em você que tanto contribui para o desenvolvimento do País, a CCR, em parceria com a Cia. da Consulta, está oferecendo 50 mil consultas médicas online gratuitas! A consulta online disponibilizada é focada na COVID-19 e será realizada por vídeo chamada.'),
  Noticias(
      nome: '7 pontos de parada gratuitos para descansar durante a viagem',
      url:
          "https://i0.wp.com/trucao.com.br/wp-content/uploads/2017/06/pontos_de_parada.jpg?fit=1200%2C800&amp;ssl=1",
      texto:
          'Quem ganha a vida rodando pelas estradas sabe o quão cansativo pode ser a jornada de um estradeiro. Por isso, as horas de descanso são de extrema importância para a saúde e segurança do motorista e logo, da carga. Aqui no site e no Programa Pé na Estrada, sempre reforçamos a importância da criação e investimento em pontos de parada gratuitos. Inclusive, já falamos no Pé na Estrada sobre como a falta de descanso pode afetar a saúde do caminhoneiro.'),
];
