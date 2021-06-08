


## Routes

  - `GET /auth/token`  
    Retourne un JWT, requiert un HTTP Basic Authentication valide.
  - `POST /score`  
    Attend la rapport de match. Attend un JWT en HTTP Bearer Authentication; le jeton doit comporter le role `referee`.
  - `GET /standings`  
    Retourne le classement du championnat. Attend un JWT en HTTP Bearer Authentication; le jeton doit comporter le role `press`.
