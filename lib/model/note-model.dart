class Note{
  int? id;
  String? title;
  String? subtitle;
  String? description;

  Note({this.id,this.title,this.subtitle,this.description});
  // convert model to map
Map<String,dynamic>toMap(){
  return{
    'id':id,
    'title':title,
    'subtitle':subtitle,
    'description':description
  };
}


// Fetching data
  factory Note.fromMap(Map<String,dynamic>map){
    return Note(
      id: map['id'],
      title: map['title'],
      subtitle: map['subtitle'],
      description: map['description']
    );
  }


}