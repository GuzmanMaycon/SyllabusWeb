package com.junior.to;

public enum EstadoSyllabus {
    A("ACEPTADO"),
    R("RECHAZADO"),
    E("EN ESPERA"),
    N("NO ENTREGADO");

    private final String text;

    /**
     * @param text
     */
    private EstadoSyllabus(final String text) {
        this.text = text;
    }

    /* (non-Javadoc)
     * @see java.lang.Enum#toString()
     */
    @Override
    public String toString() {
        return text;
    }
}
