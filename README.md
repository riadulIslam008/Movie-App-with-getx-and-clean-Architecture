# 🎬 Flutter Movie App

A beautifully designed Flutter Movie App built with **GetX**, **Hive**, and **SQLite** for state management, local storage, and persistent data handling. The app fetches movie data via TMDB API, displays trending & popular movies, allows users to search, view details & cast, watch YouTube trailers, save favorites, and submit feedback via Wiredash.

---

## 🔗 Live Demo

Try the app online: [https://movie-details-app.web.app/](https://movie-details-app.web.app/)

---

---

## 🎯 Features

    Browse Popular, Trending, Now Playing, and Upcoming movies

    Dynamic background that updates based on the first selected movie

    Search movies live via TMDB API

    View movie details with cover photo, poster, genre, release date, rating, storyline, and cast

    Tap cast roles to view full biography and filmography

    Watch teasers and trailers embedded using YouTube API

    Favorite movie list saved locally via Hive database

    User feedback submission through Wiredash

## 🛠 Tech Stack

    Flutter for UI

    GetX for state management & dependency injection

    Hive for local NoSQL storage

    SQLite for persistent relational storage

    Dartz & Equatable for clean architecture tooling

    YouTube Player IFrame for trailer playback

    Wiredash for in-app user feedback
---

## 📱 Screenshots

<table>
  <tr>
    <td><img src="https://raw.githubusercontent.com/riadulIslam008/Amer-School-Images/main/movie-app/image1.webp" width="100%"></td>
    <td><img src="https://raw.githubusercontent.com/riadulIslam008/Amer-School-Images/main/movie-app/image2.webp" width="100%"></td>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/riadulIslam008/Amer-School-Images/main/movie-app/image3.webp" width="100%"></td>
    <td><img src="https://raw.githubusercontent.com/riadulIslam008/Amer-School-Images/main/movie-app/image4.webp" width="100%"></td>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/riadulIslam008/Amer-School-Images/main/movie-app/image5.webp" width="100%"></td>
    <td><img src="https://raw.githubusercontent.com/riadulIslam008/Amer-School-Images/main/movie-app/image6.webp" width="100%"></td>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/riadulIslam008/Amer-School-Images/main/movie-app/image7.webp" width="100%"></td>
    <td><img src="https://raw.githubusercontent.com/riadulIslam008/Amer-School-Images/main/movie-app/image8.webp" width="100%"></td>
  </tr>
</table>

---

## 📂 Folder Structure

```plaintext
lib/
├── main.dart
├── di/
│   └── Binding.dart
├── App/
│   ├── Core/
│   │   ├── Arguments/
│   │   │   ├── BackGround_Argument.dart
│   │   │   ├── BlurSection_Argument.dart
│   │   │   ├── MovieMenu_Argument.dart
│   │   │   └── Search_Argument.dart
│   │   ├── assets/
│   │   │   ├── assetsImage.dart
│   │   │   └── NetworkImage.dart
│   │   ├── errors/
│   │   │   ├── AppError.dart
│   │   │   └── Custome_Error.dart
│   │   ├── network/
│   │   │   └── CheckConnectivety.dart
│   │   ├── utils/
│   │   │   ├── const_string.dart
│   │   │   ├── screenSize.dart
│   │   │   └── UtilsColors.dart
│   │   └── widgets/
│   │       ├── About_Dialog_Box.dart
│   │       ├── Assets_Image.dart
│   │       ├── Button_Widget.dart
│   │       ├── Cached_Image_Section.dart
│   │       ├── Error_Dialog.dart
│   │       ├── Error_Image_Section.dart
│   │       ├── Title_Text.dart
│   │       └── Wiredash.dart
│   ├── data/
│   │   ├── api/
│   │   │   └── ApiConstants.dart
│   │   ├── dataSources/
│   │   │   ├── Core/
│   │   │   │   ├── ApiClient.dart
│   │   │   │   └── SQL_Lite.dart
│   │   │   ├── local/
│   │   │   │   ├── Local_Data_Source.dart
│   │   │   │   └── Local_Hive_Data.dart
│   │   │   └── remote/
│   │   │       └── remote_data_sources.dart
│   │   └── models/
│   │       ├── Hive/
│   │       │   ├── hive_db.dart
│   │       │   └── hive_db.g.dart
│   │       ├── Cast_Details.dart
│   │       ├── Cast_Person_Details.dart
│   │       ├── MovieDetails.dart
│   │       ├── MovieModel.dart
│   │       ├── MovieResult.dart
│   │       ├── Movie_Table.dart
│   │       ├── Search_Movie_Model.dart
│   │       └── Videos_Model.dart
│   ├── domain/
│   │   ├── entites/
│   │   │   ├── Cast_Entity.dart
│   │   │   ├── Cast_Personal_Entity.dart
│   │   │   ├── Movie_Details_Entity.dart
│   │   │   ├── Movie_entity.dart
│   │   │   ├── Movie_Param.dart
│   │   │   ├── Movie_Search_Param.dart
│   │   │   ├── NoParams.dart
│   │   │   ├── Search_Movies_Entitty.dart
│   │   │   └── Video_Entity.dart
│   │   ├── repositories/
│   │   │   └── Movie_Repository.dart
│   │   └── useCases/
│   │       ├── Delete_from_Hive.dart
│   │       ├── delete_Movie_Table.dart
│   │       ├── get_CastDetails.dart
│   │       ├── get_Cast_Personal_Details.dart
│   │       ├── get_Favourite_Movies_From_Hive.dart
│   │       ├── get_Favourite_Movie_Table.dart
│   │       ├── get_MovieDetails.dart
│   │       ├── get_nowPlaying.dart
│   │       ├── get_popular.dart
│   │       ├── get_Search_Movies.dart
│   │       ├── get_Trending.dart
│   │       ├── get_upcoming.dart
│   │       ├── get_VideoDetails.dart
│   │       ├── Save_Favourite_Movies_inHive.dart
│   │       ├── Save_MovieTable.dart
│   │       └── UseCases.dart
│   ├── presentation/
│   │   ├── Cast_Profile_Section/
│   │   │   ├── Cast_Profile_Controller.dart
│   │   │   └── Cast_Profile_View.dart
│   │   ├── HomePage/
│   │   │   ├── widgets/
│   │   │   │   ├── BackGroundSection.dart
│   │   │   │   ├── BlurSection.dart
│   │   │   │   ├── Expansion_Tile_Section.dart
│   │   │   │   ├── ForeGroundSection.dart
│   │   │   │   ├── MovieList_section.dart
│   │   │   │   ├── Movie_Menu_Section.dart
│   │   │   │   ├── Movie_Poster.dart
│   │   │   │   ├── Serach_Section.dart
│   │   │   │   └── Show_Search_Movie_List.dart
│   │   │   ├── HomeController.dart
│   │   │   └── HomeView.dart
│   │   ├── loadingPage/
│   │   │   └── LoadingSpiner.dart
│   │   ├── MovieDetailsPage/
│   │   │   ├── Widgets/
│   │   │   │   ├── Cast_Details_View.dart
│   │   │   │   ├── Cover_Photo.dart
│   │   │   │   ├── FavouriteIcon.dart
│   │   │   │   ├── Movie_Details_List.dart
│   │   │   │   ├── Movie_Info_Section.dart
│   │   │   │   └── Movie_poster_section.dart
│   │   │   ├── Movie_Details.dart
│   │   │   └── Movie_Details_Controller.dart
│   │   ├── ViewPort/
│   │   │   └── View_Port.dart
│   │   └── WatchTrailerPage/
│   │       ├── watch_Trailer.dart
│   │       └── Watch_Trailer_Controller.dart
│   ├── routes/
│   │   ├── App_Pages.dart
│   │   └── App_routes.dart
│   └── theme/
│       └── ThemeTextStyle.dart

```


### 📦 Dependencies

| Package                 | Version  | Description                   |
| ----------------------- | -------- | ----------------------------- |
| flutter                 | sdk      | Flutter framework             |
| cached\_network\_image  | ^3.1.0   | Load & cache network images   |
| cupertino\_icons        | ^1.0.2   | iOS style icons               |
| dartz                   | ^0.10.0  | Functional programming tools  |
| equatable               | ^2.0.3   | Value equality                |
| get                     | ^4.3.8   | State management & navigation |
| hive                    | ^2.1.0   | Lightweight NoSQL database    |
| hive\_flutter           | ^1.1.0   | Flutter integration for Hive  |
| http                    | ^0.13.3  | HTTP networking               |
| sqflite                 | ^2.0.0+4 | SQLite database               |
| wiredash                | ^0.7.0+1 | In-app feedback               |
| youtube\_player\_iframe | ^2.2.2   | YouTube player integration    |

