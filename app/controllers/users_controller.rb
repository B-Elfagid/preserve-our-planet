class UsersController < ApplicationController



 get "/about" do
   erb :"users/about.html"
 end

 get "/news" do
   erb :"users/news.html"
 end

 end

