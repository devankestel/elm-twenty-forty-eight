module Main exposing (..)

import Html exposing (Html, text, div, img)
import Html.Attributes exposing (..)


---- MODEL ----


type alias Block =
    { color : String
    , label : String
    , value : Int
    }


type alias Model =
    { blocks : List Block }


blocks : List Block
blocks =
    [ { color = "red", label = "A", value = 2 }
    , { color = "orange", label = "B", value = 4 }
    , { color = "yellow", label = "C", value = 8 }
    , { color = "green", label = "D", value = 16 }
    , { color = "blue", label = "E", value = 32 }
    , { color = "purple", label = "F", value = 64 }
    , { color = "pink", label = "G", value = 128 }
    , { color = "brown", label = "H", value = 2 }
    , { color = "black", label = "I", value = 2 }
    , { color = "gray", label = "J", value = 2 }
    , { color = "gold", label = "K", value = 2 }
    ]


init : ( Model, Cmd Msg )
init =
    ( { blocks = blocks }, Cmd.none )



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
        [ img [ src "/logo.svg" ] []
        , div [] [ text (toString model.blocks) ]
        , blockList model.blocks
        ]


blockList : List Block -> Html Msg
blockList blocks =
    blocks
        |> List.map block
        |> div []


block : Block -> Html Msg
block block =
    div []
        [ div [ class "block", class block.color ] [ text block.label ]
        ]



---- PROGRAM ----


main : Program Never Model Msg
main =
    Html.program
        { view = view
        , init = init
        , update = update
        , subscriptions = always Sub.none
        }
