module Main exposing (..)

import Html exposing (..)


-- import Time.DateTime as DateTime exposing (DateTime, dateTime)
-- MAIN


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = initModel
        , view = view
        , update = update
        }



-- MODEL


type alias Category =
    { name : String
    , pointValue : Int
    }


type alias Completion =
    { isCompleted : Bool
    , dateCompleted : Int
    }


type alias Task =
    { title : String
    , category : Category
    , completion : Completion
    }


type alias Model =
    { categories : List Category
    , tasks : List Task
    }


dragon : Category
dragon =
    { name = "Dragon"
    , pointValue = 1
    }


mermaid : Category
mermaid =
    { name = "Mermaid"
    , pointValue = 3
    }


maze : Category
maze =
    { name = "Maze"
    , pointValue = 10
    }


categories : List Category
categories =
    [ dragon
    , mermaid
    , maze
    ]


tasks : List Task
tasks =
    [ { title = "This is the first task. Dragons."
      , category = dragon
      , completion = { isCompleted = False, dateCompleted = 0 }
      }
    , { title = "This is the second task. Mermaids."
      , category = mermaid
      , completion = { isCompleted = False, dateCompleted = 0 }
      }
    , { title = "This is the third task. Maze."
      , category = maze
      , completion = { isCompleted = False, dateCompleted = 0 }
      }
    ]


initModel : Model
initModel =
    { categories = categories
    , tasks = tasks
    }



-- UPDATE


type Msg
    = Clear


update : Msg -> Model -> Model
update msg model =
    case msg of
        Clear ->
            initModel



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Tasks" ]
        , taskList model
        ]


taskList : Model -> Html Msg
taskList model =
    model.tasks
        |> List.map task
        |> ul []


task : Task -> Html Msg
task task =
    li []
        [ div [] [ text (toString task.completion.isCompleted) ]
        , div [] [ text task.title ]
        , div [] [ text task.category.name ]
        , div [] [ text (toString task.category.pointValue) ]
        , div [] [ text (toString task.completion.dateCompleted) ]
        ]
