from django.shortcuts import render, redirect
from .models import Usuario, Producto, Venta, DetalleVenta
from decimal import Decimal


def index(request):
    usuario = Usuario.objects.all()
    if request.method == "POST":
        user = request.POST.get("username")
        contraseña = request.POST.get("password")
        if usuario.filter(nombre=user, password=contraseña).exists():
            request.session['usuario'] = user
            request.session['id_usuario'] = usuario.get(nombre=user).id
            return redirect("inicio")
        erro = "Usuario o contraseña incorrecta"
        return render(request, "index.html", {"error": erro})
    return render(request, "index.html")

def cerrar_sesion(request):
    try:
        del request.session['usuario']
    except KeyError:
        pass
    return redirect('index')


def inicio(request):
    try:
        if not request.session['usuario']:
            return redirect('index')
    except KeyError:
        return redirect('index')
    id_usuario = request.session.get('id_usuario')
    venta = Venta.objects.filter(id_usuario=id_usuario).order_by('-id_venta')[:5]
    usuario = Usuario.objects.filter(id=id_usuario).order_by('-id')[:5]
    producto = Producto.objects.filter(id_usuario=id_usuario).order_by('-id_producto')[:5]
    user = request.session.get('usuario')

    return render(request, "inicio.html", {"usuarios": usuario, "productos": producto, "ventas": venta, "user": user})


def productos(request):
    try:
        if not request.session['usuario']:
            return redirect('index')
    except KeyError:
        return redirect('index')
    id_usuario = request.session.get('id_usuario')
    user = request.session.get('usuario')
    productos = Producto.objects.filter(id_usuario=id_usuario).order_by('-id_producto')

    return render(request, "productos.html", {"productos": productos, "user": user})


def ventas(request):
    try:
        if not request.session['usuario']:
            return redirect('index')
    except KeyError:
        return redirect('index')
    id_usuario = request.session.get('id_usuario')
    user = request.session.get('usuario')
    usuario = Usuario.objects.get(id=id_usuario)
    ventas = Venta.objects.filter(id_usuario=usuario).order_by('-id_venta')

    return render(request, "ventas.html", {"ventas": ventas, "user": user})


def usuarios(request):
    try:
        if not request.session['usuario']:
            return redirect('index')
    except KeyError:
        return redirect('index')
    user = request.session.get('usuario')
    usuarios = Usuario.objects.all().order_by('-id')
    return render(request, "usuarios.html", {"usuarios": usuarios, "user": user})


def agregar_producto(request):
    try:
        if not request.session['usuario']:
            return redirect('index')
    except KeyError:
        return redirect('index')
    if request.method == "POST":
        nombre_producto = request.POST.get("nombre")
        precio = request.POST.get("precio")
        stock = request.POST.get("stock", 0)
        id_usuario = request.session.get('id_usuario')
        Producto.objects.create(nombre_producto=nombre_producto, precio=Decimal(precio), stock=int(stock), id_usuario_id=id_usuario)
        return redirect("productos")
    return render(request, "crear_producto.html")


def agregar_venta(request):
    try:
        if not request.session['usuario']:
            return redirect('index')
    except KeyError:
        return redirect('index')
    if request.method == "POST":
        id_usuario = request.POST.get("usuario")
        id_producto = request.POST.get("producto")
        cantidad = int(request.POST.get("cantidad"))
        total_venta = Decimal(request.POST.get("total"))

        try:
            usuario = Usuario.objects.get(id=id_usuario)
        except Usuario.DoesNotExist:
            usuarios = Usuario.objects.all()
            productos = Producto.objects.all()
            return render(request, "crear_venta.html", {
                "usuarios": usuarios, 
                "productos": productos,
                "error": "Usuario no encontrado"
            })
            
        try:
            producto = Producto.objects.get(id_producto=id_producto)
        except Producto.DoesNotExist:
            usuarios = Usuario.objects.all()
            productos = Producto.objects.all()
            return render(request, "crear_venta.html", {
                "usuarios": usuarios, 
                "productos": productos,
                "error": "Producto no encontrado"
            })
            
        if producto.stock < cantidad:
            usuarios = Usuario.objects.all()
            productos = Producto.objects.all()
            return render(request, "crear_venta.html", {
                "usuarios": usuarios, 
                "productos": productos,
                "error": f"Stock insuficiente. Disponible: {producto.stock}, Solicitado: {cantidad}"
            })
            
        venta = Venta.objects.create(id_usuario=usuario, id_producto=producto, total_venta=total_venta)
        
        if venta:
            precio_unitario = producto.precio
            DetalleVenta.objects.create(
                id_venta=venta,
                id_producto=producto,
                cantidad=cantidad,
                precio_unitario=precio_unitario,
                subtotal=precio_unitario * cantidad
            )
            producto.stock -= cantidad
            producto.save()
        return redirect("ventas")
    
    usuarios = Usuario.objects.filter(id=request.session.get('id_usuario'))
    productos = Producto.objects.filter(id_usuario=request.session.get('id_usuario'))
    return render(request, "crear_venta.html", {"usuarios": usuarios, "productos": productos})


def detalle_venta(request, venta_id):
    try:
        if not request.session['usuario']:
            return redirect('index')
    except KeyError:
        return redirect('index')
    try:
        venta = Venta.objects.get(id_venta=venta_id)
        detalles = DetalleVenta.objects.filter(id_venta=venta)
        return render(request, "detalle_venta.html", {"venta": venta, "detalles": detalles})
    except Venta.DoesNotExist:
        return redirect("ventas")
    
def crear_usuario(request):
    if request.method == "POST":
        nombre = request.POST.get("nombre")
        email = request.POST.get("email")
        password = request.POST.get("password")
        Usuario.objects.create(nombre=nombre, email=email, password=password)
        return redirect("index")
    return render(request, "crear_usuario.html")
    