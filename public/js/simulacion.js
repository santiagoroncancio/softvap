$(document).ready(function(){

    let heightTitle = [];
    let heightP = [];

    $('.card-title').each(function(){
      heightTitle.push($(this).height());
    });

    $('.card-text').each(function(){
      heightP.push($(this).height());
    });

  let maxTitle = Math.max.apply(null, heightTitle);
  let maxP = Math.max.apply(null, heightP);

  $('.card-title').each(function(){
    //Aplicamos a todos los divs la misma altura
    $(this).height(maxTitle);
  });

  $('.card-text').each(function(){
    //Aplicamos a todos los divs la misma altura
    $(this).height(maxP);
  });

});