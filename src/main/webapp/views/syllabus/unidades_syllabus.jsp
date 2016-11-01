<div id="unidades">
    <div class="clickable unidad"
        id="unidad_{{ unidad.id }}"
        v-for="unidad in unidades"
        @click="select_unidad(unidad)"
    >
        <p>
            <span>{{ unidad.name }}</span>
            <a type="button"
               class="btn btn-danger float-right"
               v-show="unidad_selected == unidad"
               title="Eliminar"
               @click="delete_unidad(unidad)"
            >
              <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
            </a>
        </p>
    </div>
</div>