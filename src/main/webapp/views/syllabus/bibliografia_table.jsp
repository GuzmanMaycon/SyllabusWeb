<table class="table table-responsive">
    <thead>
        <th>Autor(es)</th>
        <th class="hidden-xs hidden-sm">Año de publicación</th>
        <th class="visible-xs visible-sm">Año</th>
        <th>Título</th>
        <th class="hidden-xs hidden-sm">Editorial</th>
        <th class="hidden-xs hidden-sm">ISBN-13</th>
        <th></th>
    </thead>
    <tbody>
        <tr v-for="ref in ref_bibliografica"
            id="ref_{{ ref.id }}"
            class="clickable"
            @click="add_binding_ref(ref)">
            <td>{{ ref.author }}</td>
            <td>{{ ref.year }}</td>
            <td>{{ ref.title }}</td>
            <td class="hidden-xs hidden-sm">{{ ref.editorial }}</td>
            <td class="hidden-xs hidden-sm">{{ ref.isbn }}</td>
            <td>
                <a class="btn btn-danger"
                   title="Eliminar"
                   @click="delete_ref_bibliografica(ref)">
                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                </a>
            </td>
        </tr>
    </tbody>
</table>