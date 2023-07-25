// import 'package:go_router/go_router.dart';
// import 'package:noticias_cineforo/screens/article_detail_screen.dart';
// import 'package:noticias_cineforo/screens/headlines_screen.dart';



// final appRouter = GoRouter(
//   initialLocation: '/home/',
//   routes: [
    
//     GoRoute(
//       path: '/home/',
//       name: HeadlinesScreen.name,
//       builder: (context, state) {
//         // final pageIndex = int.parse( state.params['page'] ?? '0' );

//         return const HeadlinesScreen();
//       },
//       routes: [
//          GoRoute(
//           path: 'article/:articleId',
//           name: ArticleDetailScreen.name,
//           builder: (context, state) {
//             final articleId = state.pathParameters['articleId'] !;

//             return ArticleDetailScreen( articleId: articleId );
//           },
//         ),
//       ]
//     ),

//     GoRoute(
//       path: '/',
//       redirect: ( _ , __ ) => '/home/0',
//     ),

//   ]
// );