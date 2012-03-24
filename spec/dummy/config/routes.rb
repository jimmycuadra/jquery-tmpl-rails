Dummy::Application.routes.draw do
  match "prefix" => "main#prefix"
  root to: "main#index"
end
