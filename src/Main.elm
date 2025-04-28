module Main exposing (..)

-- Implement Queue for Student Vie


import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Queue exposing (..)


-- MAIN


main =
  Browser.sandbox { init = init, update = update, view = view }



-- MODEL
type alias Student = {
    firstName : String, 
    lastName : String, 
    email : String,
    standing : Int
  }

type alias Model = Queue Student

init : Model
init =
  empty


-- UPDATE

type Msg = Enqueue | Dequeue

update : Msg -> Model -> Model
update msg model =
  case msg of
    Enqueue ->
      enqueue { firstName = "Nandini",
                lastName = "Venkatesh",
                email = "nvenkate@umd.edu",
                standing = (length model) + 1 } model
    Dequeue -> case (dequeue model) of
      Nothing -> model
      Just (val, q) -> q


-- VIEW
viewQueue : Model -> String
viewQueue model =
  foldl (\x acc -> acc ++ x.firstName ++ " " ++ x.lastName ++ " " ++ (String.fromInt x.standing)) "" model

view : Model -> Html Msg
view model =
  div []
    [ button [ onClick Enqueue ] [ text "Add to queue" ]
    , text (viewQueue model)
    , button [ onClick Dequeue ] [ text "Remove from queue"]
    ]