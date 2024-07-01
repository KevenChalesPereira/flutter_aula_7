class Imagens {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  const Imagens({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  factory Imagens.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'albumId': int albumIdR,
        'id': int idR,
        'title': String tituloR,
        'url': String urlR,
        'thumbnailUrl': String thumbnailUrlR
      } =>
        Imagens(
            albumId: albumIdR,
            id: idR,
            title: tituloR,
            url: urlR,
            thumbnailUrl: thumbnailUrlR),
      _ => throw const FormatException('Falha ao carregar poste.')
    };
  }
}
