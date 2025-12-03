from django.urls import path
from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("inicio", views.inicio, name="inicio"),
    path("productos/", views.productos, name="productos"),
    path("ventas/", views.ventas, name="ventas"),
    path("usuarios/", views.usuarios, name="usuarios"),
    path("agregar_producto/", views.agregar_producto, name="agregar_producto"),
    path("agregar_venta/", views.agregar_venta, name="agregar_venta"),
    path("detalle_venta/<int:venta_id>/", views.detalle_venta, name="detalle_venta"),
    path("agregar_usuario/", views.crear_usuario, name="agregar_usuario"),
    path("cerrar_sesion/", views.cerrar_sesion, name="cerrar_sesion"),
]