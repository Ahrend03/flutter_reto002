import 'package:flutter/material.dart';

class CorreosPage extends StatefulWidget {
  @override
  State<CorreosPage> createState() => _CorreosPage();
}

class _CorreosPage extends State<CorreosPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color(0xFFF2F2F2),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Acción cuando se presiona el botón flotante
            setState(() {});
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFFF2F2F2),
          leading: IconButton(
            icon: Icon(Icons.sort_outlined),
            onPressed: () {
              // Acción cuando se presiona el icono del menú
            },
          ),
          title: Text(
            'Email',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Acción cuando se presiona el icono de búsqueda
              },
            ),
          ],
          bottom: TabBar(
            labelColor: Colors.lightBlue, // Color de la pestaña seleccionada
            unselectedLabelColor: Colors.black, // Color de las pestañas no seleccionadas
            indicatorColor: Colors.lightBlue, // Color del indicador de la pestaña seleccionada
            tabs: [
              Tab(text: 'Inbox'),
              Tab(text: 'Sent'),
              Tab(text: 'Draft'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: <Widget>[
                EmailListItem(
                  remitente: 'Melvin Sherman',
                  asunto: 'Fonts, Mockups & Templates',
                  vistaPrevia: 'It\'s Friday and hora for some Free products! Here are the latest freebies to arrive on our sites.',
                  hora: '10:30 am',
                  adjuntos: 2,
                  isRead: false,
                ),
                EmailListItem(
                  remitente: 'Albert Collinson',
                  asunto: 'Finished the part of UX',
                  vistaPrevia: 'Hey, I have finished the part of UX. Now you can check the Invisionapp project attachment.',
                  hora: '9:30 am',
                  adjuntos: 1,
                  isRead: true,
                ),
                EmailListItem(
                  remitente: 'Zlatan Ibrahimovic',
                  asunto: 'Scored his very fast goal',
                  vistaPrevia: 'Zlatan Ibrahimovic is a Swedish professional footballer who plays as a forward for LA Galaxy.',
                  hora: '10:30 am',
                  adjuntos: 2,
                  isRead: false,
                ),
                EmailListItem(
                  remitente: 'Marvel Entertainment',
                  asunto: 'Return of Wolverine',
                  vistaPrevia: 'He\'s back, bub. New powers, new enemies, new challenges. Logan\'s back and he\'s ready to carve out...',
                  hora: '8:00 am',
                  adjuntos: 0,
                  isRead: false,
                  isStarred: true,
                ),
              ],
            ),
            Center(child: Text('')),
            Center(child: Text('')),
          ],
        ),
      ),
    );
  }
}

class EmailListItem extends StatefulWidget {
 final String remitente;
  final String asunto;
  final String vistaPrevia;
  final String hora;
  final int adjuntos;
  final bool isRead;
  final bool isStarred;

  EmailListItem({
    required this.remitente,
    required this.asunto,
    required this.vistaPrevia,
    required this.hora,
    required this.adjuntos,
    this.isRead = false,
    this.isStarred = false,
  });

  @override
  _EmailListItemState createState() => _EmailListItemState();
}

class _EmailListItemState extends State<EmailListItem> {
  late bool isStarred;

  @override
  void initState() {
    super.initState();
    isStarred = widget.isStarred;
  }

  void toggleStar() {
    setState(() {
      isStarred = !isStarred;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          
        ),
        elevation: 4, // Añade sombra
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.remitente,
                        style: TextStyle(
                          fontWeight: widget.isRead ? 
                          FontWeight.normal : FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.hora,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.asunto,
                    style: TextStyle(
                      fontWeight: widget.isRead ? FontWeight.normal : FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(widget.vistaPrevia),
                  if (widget.adjuntos > 0) ...[
                    SizedBox(height: 8.0),
                    ElevatedButton(
                      onPressed: () {
                        // Acción cuando se presiona el botón de archivos adjuntos
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.attach_file, size: 16),
                          SizedBox(width: 4.0),
                          Text('${widget.adjuntos} file attachment(s)'),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Column(
                  children: [
                    IconButton(
                      icon: Icon(
                        isStarred ? Icons.star : Icons.star_border,
                        color: isStarred ? Colors.yellow : Colors.grey,
                      ),
                      onPressed: toggleStar,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}