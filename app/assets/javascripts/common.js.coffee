#= require froala_editor.min.js

$ ->
  $('.panel').matchHeight()
  $('.editor').froalaEditor({
    inlineMode: false,
    heightMin: '200px',
  });
  $('.flatpickr').flatpickr();
