import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'news_provider.dart';
import 'news_detail_screen.dart';

void main() {
  runApp(const FinalApp());
}

class FinalApp extends StatelessWidget {
  const FinalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: MaterialApp(
        title: 'Final App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const NewsScreen(),
      ),
    );
  }
}

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Noticias MINERD'),
      ),
      body: newsProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: newsProvider.newsList.length,
              itemBuilder: (context, index) {
                final news = newsProvider.newsList[index];
                return Card(
                  margin: const EdgeInsets.all(10.0),
                  color: Colors.blue[50],
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(10.0),
                    leading: const Icon(Icons.article, color: Colors.blue, size: 40),
                    title: Text(news.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('Toca para leer más', style: TextStyle(color: Colors.grey[600])),
                    trailing: const Icon(Icons.arrow_forward, color: Colors.blue),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsDetailScreen(news: news),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          newsProvider.fetchNews();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
