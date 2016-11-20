window.Laravel = "";
var vm = new Vue(
{
	el: '#app',

	data: {
		hay_temas_extras: false,
		temas_extras: [],
		nuevo_tema_extra: "",
	},

	methods: {
		selectTema: function(id) {
			var checkbox = document.getElementById('tema_' + id)
			var tema = document.getElementById('span_' + id)
			tema.innerHTML = (checkbox.dataset.cumplido == 0) ? 'Si' : 'No'
			checkbox.dataset.cumplido = (checkbox.dataset.cumplido == 1) ? 0 : 1
		},

		agregar_tema_extra: function() {
			if (this.nuevo_tema_extra != "") {
				this.temas_extras.push(this.nuevo_tema_extra)
				this.nuevo_tema_extra = ""
			}
		},
	},
});