window.Laravel = "";
var vm = new Vue(
{
    el: '#app',

    data: {
        unidades: [],
        semanas: [],
        temas: [],
        ref_bibliografica: [],

        unidad_selected: {},
        semana_selected: {},
        tema_selected: {},
        ref_selected: {},

        last_unidad_id: 0,
        last_semana_id: 0,
        last_tema_id: 0,
        last_ref_id: 0,

        see_preview: false,
        max_unidades: 5,
        max_semanas: 17,
        max_semanas_por_unidad: 5,

        new_tema: '',
        edit_tema: '',

        new_ref_autor: '',
        new_ref_anio: '',
        new_ref_titulo: '',

        edit_ref_autor: '',
        edit_ref_anio: '',
        edit_ref_titulo: '',

        tema_title: '',
    },

    methods: {
        select_unidad: function(unidad) {
            var last_unidad = document.getElementById('unidad_' + this.unidad_selected.id)
            var unidad_element = document.getElementById('unidad_' + unidad.id)

            if (this.unidad_selected.id == undefined) {
                unidad_element.className += ' unidad-selected'
                this.unidad_selected = unidad
            } else {
                if (this.unidad_selected.id == unidad.id) {
                    unidad_element.className = 'clickable unidad'
                    this.unidad_selected = {}
                } else {
                    last_unidad.className = 'clickable unidad'
                    unidad_element.className += ' unidad-selected'
                    this.unidad_selected = unidad
                }
            }
            this.semana_selected = {}
            this.tema_selected = {}
        },
        select_semana: function(semana) {
            var last_semana = document.getElementById('semana_' + this.semana_selected.id)
            var semana_element = document.getElementById('semana_' + semana.id)

            if (this.semana_selected.id == undefined) {
                semana_element.className += ' semana-selected'
                this.semana_selected = semana
            } else {
                if (this.semana_selected.id == semana.id) {
                    semana_element.className = 'clickable semana'
                    this.semana_selected = {}
                } else {
                    last_semana.className = 'clickable semana'
                    semana_element.className += ' semana-selected'
                    this.semana_selected = semana
                }
            }
            this.tema_selected = {}
        },
        select_tema: function(tema) {
            var last_tema = document.getElementById('tema_div_' + this.tema_selected.id)
            var tema_element = document.getElementById('tema_div_' + tema.id)

            if (this.tema_selected.id == undefined) {
                tema_element.className += ' tema-selected'
                this.tema_selected = tema
            } else {
                if (this.tema_selected.id == tema.id) {
                    tema_element.className = 'clickable tema'
                    this.tema_selected = {}
                } else {
                    last_tema.className = 'clickable tema'
                    tema_element.className += ' tema-selected'
                    this.tema_selected = tema
                }
            }
        },
        select_ref: function(ref) {
            var last_ref = document.getElementById('ref_' + this.ref_selected.id)
            var ref_element = document.getElementById('ref_' + ref.id)

            if (this.ref_selected.id == undefined) {
                ref_element.className += ' ref-selected'
                this.ref_selected = ref
            } else {
                if (this.ref_selected.id == ref.id) {
                    ref_element.className = 'clickable ref'
                    this.ref_selected = {}
                } else {
                    last_ref.className = 'clickable ref'
                    ref_element.className += ' ref-selected'
                    this.ref_selected = ref
                }
            }
        },
        add_unidad: function() {
            var new_id = ++this.last_unidad_id
            var len_unidades = this.unidades.length
            if (len_unidades < this.max_unidades)
                this.unidades.push({
                    id: new_id,
                    name: 'Unidad ' + (len_unidades + 1)
                })
            else
                alert("Muchas unidades")
        },
        delete_unidad: function(unidad) {
            this.semanasUnidadSeledted(unidad).forEach(function(semana, index){
                vm.delete_semana(semana)
            })
            this.unidades.forEach(function(elemento, index, array){
                if (elemento.id == unidad.id)
                    array.splice(index, 1)
            })

            this.unidades.forEach(function(elemento, index){
                elemento.name = 'Unidad ' + (index + 1)
            })

            this.unidad_selected = {}
        },
        add_semana: function() {
            var new_id = ++this.last_semana_id
            var len_semanas = this.semanas.length
            if (len_semanas < this.max_semanas) {
                var unidad = this.unidad_selected
                var len_semanas_por_unidad = this.semanas.reduce(function(total,semana){
                    return semana.unidad_id == unidad.id ? total+1 : total
                }, 0)

                if (len_semanas_por_unidad < this.max_semanas_por_unidad) {
                    this.semanas.push({
                        id: new_id,
                        name: 'Semana ' + (len_semanas + 1),
                        unidadId: this.unidad_selected.id
                    })

                    var semanas = this.semanas
                    var semanas_por_unidades = []
                    this.unidades.forEach(function(unidad, i) {
                        semanas_por_unidades[i] = semanas.reduce(function(total,semana){
                            return semana.unidad_id == unidad.id ? total+1 : total
                        }, 0)
                    })

                    var start = 0
                    this.unidades.forEach(function(unidad, i){
                        var end = start + semanas_por_unidades[i]
                        for (; start < end; start++) {
                            semanas[start].unidad_id = unidad.id
                        }
                    })
                }
                else
                    alert("Muchas semanas en una unidad")
            }
            else
                alert("Muchas semanas")
        },
        delete_semana: function(semana) {
            this.temasSemanaSelected(semana).forEach(function(tema, index){
                vm.delete_tema(tema)
            })
            this.semanas.forEach(function(elemento, index, array){
                if (elemento.id == semana.id)
                    array.splice(index, 1)
            })

            this.semanas.forEach(function(elemento, index){
                elemento.name = 'Semana ' + (index + 1)
            })

            this.semana_selected = {}
        },
        add_tema: function() {
            this.temas.push({
                id: ++this.last_tema_id,
                name: this.new_tema,
                semanaId: this.semana_selected.id,
            })
            this.new_tema = ''
            document.getElementById('new-tema').focus();
        },
        delete_tema: function(tema) {
            this.temas.forEach(function(elemento, index, array){
                if (elemento.id == tema.id)
                    array.splice(index, 1)
            })

            this.tema_selected = {}
        },
        semanasUnidadSeledted: function(unidad) {
            return this.semanas.filter(function(semana){
                return semana.unidadId == unidad.id
            })
        },
        temasSemanaSelected: function(semana) {
            return this.temas.filter(function(tema){
                return tema.semanaId == semana.id
            })
        },
        add_binding: function(tema) {
            document.getElementById('edit-tema').dataset.id = tema.id
            this.select_tema(tema)
            this.edit_tema = tema.name
        },
        add_binding_ref: function(ref) {
            document.getElementById('edit-ref-autor').dataset.id = ref.id
            document.getElementById('edit-ref-titulo').dataset.id = ref.id
            document.getElementById('edit-ref-anio').dataset.id = ref.id
            this.select_ref(ref)
            this.edit_ref_autor = ref.author
            this.edit_ref_anio = ref.year
            this.edit_ref_titulo = ref.title
        },
        actualizar_tema: function(tema) {
            var tema_filtered = this.temas.filter(function(elemento){
                return tema.id == elemento.id
            })[0]
            tema_filtered.name = this.edit_tema
            this.edit_tema = ''
            this.cancelar_actualizar()
        },
        cancelar_actualizar: function() {
            this.select_tema(this.tema_selected)
            this.tema_selected = {}
        },
        add_ref_bibliografica: function() {
            if (this.new_ref_autor != "" &&
                this.new_ref_anio != "" &&
                this.new_ref_anio > 1900 &&
                this.new_ref_anio < 2016 &&
                this.new_ref_titulo != ""
                ) {
                this.ref_bibliografica.push({
                    id: ++this.last_ref_id,
                    author: this.new_ref_autor,
                    year: this.new_ref_anio,
                    title: this.new_ref_titulo,
                })
                this.new_ref_autor = ''
                this.new_ref_anio = ''
                this.new_ref_titulo = ''
                document.getElementById('new_ref_autor').focus();
            } else {
                alert("Ingrese campos validos")
            }
        },
        delete_ref_bibliografica: function(ref) {
            this.ref_bibliografica.forEach(function(elemento, index, array){
                if (elemento.id == ref.id)
                    array.splice(index, 1)
            })
        },
        actualizar_ref: function(ref) {
            var ref_filtered = this.ref_bibliografica.filter(function(elemento){
                return ref.id == elemento.id
            })[0]
            ref_filtered.year = this.edit_ref_anio
            ref_filtered.author = this.edit_ref_autor
            ref_filtered.title = this.edit_ref_titulo
            this.edit_ref_autor = ''
            this.edit_ref_titulo = ''
            this.edit_ref_anio = ''
            this.cancelar_actualizar_ref()
        },
        cancelar_actualizar_ref: function(ref) {
            this.select_ref(this.ref_selected)
            this.ref_selected = {}
        },
        onSubmit: function() {        	
            this.$http.post('/SyllabusWS/syllabus/create', 
                {
                    unidades: this.unidades,
                    semanas: this.semanas,
                    temas: this.temas,
                    bibliografia: this.ref_bibliografica,
                },                
            	{
                	headers: { 
                        'Accept': 'application/json',
                        'Content-Type': 'application/json' 
                    },
                    dataType: 'json',
            	}                
            ).then((response) => {
            	console.info(response.data)
            }, (response) => {

            })
        }
    },

    watch: {
        semana_selected: function(newValue)
        {
            if (newValue.id == undefined)
                this.tema_title = ''
            else
                this.tema_title = 'Temas - ' + this.unidad_selected.name + ' - ' + this.semana_selected.name
        }
    },

    ready: function()
    {
        this.unidades = [
            {
                id: "1",
                name: "Unidad 1",
            },
            {
                id: "2",
                name: "Unidad 2",
            },
        ]

        var semanas = [
            {
                id: 1,
                name: "Semana 1",
                unidadId: 1,
            },
            {
                id: 2,
                name: "Semana 2",
                unidadId: 1,
            },
            {
                id: 3,
                name: "Semana 3",
                unidadId: 1,
            },
            {
                id: 4,
                name: "Semana 4",
                unidadId: 1,
            },
        ]
        this.semanas = semanas

        var temas = [
            {
                id: 1,
                name: 'Introduccion a la Programacion',
                semanaId: 1,
            },
            {
                id: 2,
                name: 'Variables',
                semanaId: 1,
            },
        ]
        this.temas = temas

        var refs = [
            {
                id: 1,
                author: 'Cesar Vallejo',
                year: '1980',
                title: 'Trilce',
            },
            {
                id: 2,
                author: 'Dan Brown',
                year: '2013',
                title: 'Inferno',
            },
        ]
        this.ref_bibliografica = refs

        this.last_unidad_id += this.unidades.length
        this.last_semana_id += semanas.length
        this.last_tema_id += temas.length
        this.last_ref_id += refs.length
    }
});