# bdd_final_2

# Ejemplo: Gestión de un Hotel con Trigger
Diseña un modelo de base de datos para un sistema de gestión de un hotel con cinco entidades principales y define un trigger para cada funcionalidad específica.

* Habitaciones: Cada habitación tiene un código único, tipo (individual, doble, suite), tarifa por noche, estado (disponible, ocupada, en mantenimiento) y capacidad máxima.

* Huéspedes: De cada huésped se almacena un código único, nombre completo, número de identificación (por ejemplo, pasaporte o DNI), número de teléfono y correo electrónico.

* Reservas: Una reserva tiene un código único, está asociada a un huésped y una habitación, e incluye la fecha de entrada, la fecha de salida, el estado de la reserva (pendiente, confirmada, cancelada) y el costo total calculado.

* Pagos: Cada pago tiene un código único, está asociado a una reserva, incluye el monto, la fecha de pago, y el método de pago (tarjeta, efectivo, transferencia).

* Servicios Adicionales: Los huéspedes pueden solicitar servicios adicionales (como desayuno, spa, transporte). Cada servicio tiene un código único, descripción, tarifa, y se puede asociar a una habitación y/o huésped durante su estancia.**
