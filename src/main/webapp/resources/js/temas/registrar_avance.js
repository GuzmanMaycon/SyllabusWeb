window.Laravel = "";
var vm = new Vue(
{
	el: '#app',
	
	data: {
		temas: [],
	},
	
	methods: {
		select_tema: function(id) {
			var checkbox = document.getElementById('tema_' + id)
			var tema = document.getElementById('span_' + id)
			tema.innerHTML = (checkbox.dataset.cumplido == 0) ? 'Si' : 'No'
			checkbox.dataset.cumplido = (checkbox.dataset.cumplido == 1) ? 0 : 1;
		},
	},
	
	
});