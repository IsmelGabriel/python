from django.shortcuts import render, redirect
from .models import Usuario, Producto, Venta, DetalleVenta
from decimal import Decimal

def inicio(request):
    ventas = Venta.objects.all()
    return render(request, "inicio.html", {"ventas": ventas})

def productos(request):
    productos = Producto.objects.all()
    return render(request, "productos.html", {"productos": productos})

def ventas(request):
    ventas = Venta.objects.all()
    return render(request, "ventas.html", {"ventas": ventas})
    