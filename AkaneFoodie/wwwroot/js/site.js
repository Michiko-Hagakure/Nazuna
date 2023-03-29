﻿// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.

let apiUrl = "https://forkify-api.herokuapp.com/api/v2/recipes";
let apiKey = "78e1919a-a054-4816-b503-31c1cb36582f";

async function GetRecipes(recipeName,id,isAllShow) {
    let resp = await fetch(`${apiUrl}?search=${recipeName}&key=${apiKey}`);
    let result = await resp.json();
    let Recipes = isAllShow ? result.data.recipes : result.data.recipes.slice(1, 7);
    showRecipes(Recipes, id);
}
function showRecipes(recipes, id) {
    $.ajax({
        contentType: "application/json; charset=utf-8",
        dataType: 'html',
        type: 'POST',
        url: '/Recipe/GetRecipeCard',
        data: JSON.stringify(recipes),
        success: function (htmlResult) {
            $('#' + id).html(htmlResult);
        }
    });
}
async function getOrderRecipe(id) {
    let resp = await fetch(`${apiUrl}/${id}?key=${apiKey}`);
    let result = await resp.json();
    console.log(result);
}