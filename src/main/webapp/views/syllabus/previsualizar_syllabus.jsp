<div class="row">
    <div class="col-lg-12" id="app">
        <div class="text-center">
            <h1>Previsualizar syllabus del curso de ${ nombreAsignatura }</h1>
        </div>
    </div>
</div>
<div class="row preview" >
    <div class="col-sm-6">
        <div v-for="unidad in unidades">
            <h2>Unidad {{ unidad.number }}</h2>
            <div class="col-sm-offset-1" v-for="semana in semanasUnidadSeledted(unidad)">
                <h3>Semana {{ semana.number}}</h3>
                <div class="col-sm-offset-1" v-for="tema in temasSemanaSelected(semana)">
                    <h4>{{ tema.name }}</h4>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <div class="col-xs-12">
        <h3>Referencia Bibliografica</h3>
    </div>
</div>
<div class="row preview">
    <div class="col-sm-6">
        <ul v-for="ref in ref_bibliografica">
            <li>{{ ref.title }}, {{ ref.author }}- {{ ref.year }}</li>
        </ul>
    </div>
</div>
<div class="row">
    <div class="text-center">
        <a class="btn btn-default" @click="see_preview = false">Cancelar previsualizacion</a>
        <button class="btn btn-primary">Guardar Syllabus</button>
    </div>
</div>