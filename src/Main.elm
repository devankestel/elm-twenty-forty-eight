module Main exposing (..)

import Html exposing (Html, text, div, img)
import Html.Attributes exposing (..)


---- MODEL ----


type alias Model =
    { grid : List Tile
    , score : Int
    , isAlive : Bool
    }


type alias TileBlueprint =
    { color : String
    , label : String
    , value : Int
    }


type alias Tile =
    { position : Position
    , tileBlueprint : TileBlueprint
    }


type alias Position =
    ( Int, Int )


blankTileBluePrint : TileBlueprint
blankTileBluePrint =
    { color = "gray", label = "", value = 0 }


aTileBluePrint : TileBlueprint
aTileBluePrint =
    { color = "red", label = "A", value = 2 }


bTileBluePrint : TileBlueprint
bTileBluePrint =
    { color = "orange", label = "B", value = 4 }


cTileBluePrint : TileBlueprint
cTileBluePrint =
    { color = "yellow", label = "C", value = 8 }


dTileBluePrint : TileBlueprint
dTileBluePrint =
    { color = "green", label = "D", value = 16 }


eTileBluePrint : TileBlueprint
eTileBluePrint =
    { color = "blue", label = "E", value = 32 }


fTileBluePrint : TileBlueprint
fTileBluePrint =
    { color = "purple", label = "F", value = 64 }


gTileBluePrint : TileBlueprint
gTileBluePrint =
    { color = "pink", label = "G", value = 128 }


hTileBluePrint : TileBlueprint
hTileBluePrint =
    { color = "brown", label = "H", value = 256 }


iTileBluePrint : TileBlueprint
iTileBluePrint =
    { color = "black", label = "I", value = 512 }


jTileBluePrint : TileBlueprint
jTileBluePrint =
    { color = "gray", label = "J", value = 1024 }


kTileBluePrint : TileBlueprint
kTileBluePrint =
    { color = "gold", label = "K", value = 2048 }


tiles : List Tile
tiles =
    [ { position = ( 1, 1 )
      , tileBlueprint = blankTileBluePrint
      }
    , { position = ( 1, 2 )
      , tileBlueprint = blankTileBluePrint
      }
    , { position = ( 1, 3 )
      , tileBlueprint = blankTileBluePrint
      }
    , { position = ( 1, 4 )
      , tileBlueprint = blankTileBluePrint
      }
    , { position = ( 2, 1 )
      , tileBlueprint = blankTileBluePrint
      }
    , { position = ( 2, 2 )
      , tileBlueprint = blankTileBluePrint
      }
    , { position = ( 2, 3 )
      , tileBlueprint = blankTileBluePrint
      }
    , { position = ( 2, 4 )
      , tileBlueprint = blankTileBluePrint
      }
    , { position = ( 3, 1 )
      , tileBlueprint = blankTileBluePrint
      }
    , { position = ( 3, 2 )
      , tileBlueprint = blankTileBluePrint
      }
    , { position = ( 3, 3 )
      , tileBlueprint = blankTileBluePrint
      }
    , { position = ( 3, 4 )
      , tileBlueprint = blankTileBluePrint
      }
    , { position = ( 4, 1 )
      , tileBlueprint = blankTileBluePrint
      }
    , { position = ( 4, 2 )
      , tileBlueprint = blankTileBluePrint
      }
    , { position = ( 4, 3 )
      , tileBlueprint = blankTileBluePrint
      }
    , { position = ( 4, 4 )
      , tileBlueprint = blankTileBluePrint
      }
    ]


init : ( Model, Cmd Msg )
init =
    ( { grid = tiles
      , score = 0
      , isAlive = True
      }
    , Cmd.none
    )



---- UPDATE ----


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    ( model, Cmd.none )



---- VIEW ----


view : Model -> Html Msg
view model =
    div []
        [ div [] [ text "2048" ]
        , div [] [ text "Score" ]
        , div [] [ text "Best" ]
        , div [] [ text "New Game" ]
        , div [] [ text (toString model.grid) ]
        , gridPrintout model.grid
        ]


gridPrintout : List Tile -> Html Msg
gridPrintout grid =
    grid
        |> List.map tile
        |> div [ class "flex-container" ]


tile : Tile -> Html Msg
tile tile =
    div [ class "block flex-box", class tile.tileBlueprint.color ] [ text tile.tileBlueprint.label ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
