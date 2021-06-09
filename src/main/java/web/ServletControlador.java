package web;

import datos.ClienteDaoJDBC;
import dominio.Cliente;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ServletControlador")
public class ServletControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        accionDefault(req, resp);
    }

    private double saldoTotal(List<Cliente> clientes) {
        double saldoTotal = 0;
        for (Cliente cliente : clientes) {
            saldoTotal += cliente.getSaldo();
        }
        return saldoTotal;
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String accion = req.getParameter("accion");
        if (accion != null) {
            switch (accion) {
                case "insertar":
                    insertarCliente(req, resp);
                    break;
            }
        }
        accionDefault(req, resp);
    }

    private void insertarCliente(HttpServletRequest req, HttpServletResponse resp) {
        String nombre = req.getParameter("nombre");
        String apellido = req.getParameter("apellido");
        String email = req.getParameter("email");
        String telefono = req.getParameter("telefono");
        double saldo = 0;
        String saldoString = req.getParameter("saldo");
        if(saldoString != null && !"".equals(saldoString)){
            saldo = Double.parseDouble(saldoString);
        }
        new ClienteDaoJDBC().insertar(new Cliente(nombre, apellido, email, telefono, saldo));
    }

    private void accionDefault(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        List<Cliente> clientes = new ClienteDaoJDBC().listar();
        System.out.print("Clientes= " + clientes);
        HttpSession sesion = req.getSession(); 
        // HttpSession necesario para que se conservar los valores despues del redirect
        
        sesion.setAttribute("clientes", clientes);
        sesion.setAttribute("saldoTotal", saldoTotal(clientes));
        sesion.setAttribute("totalClientes", clientes.size());
        // req.getRequestDispatcher("clientes.jsp").forward(req, resp); // se ejecuta
        //el mismo direccion, no se entera la vista
        resp.sendRedirect("clientes.jsp"); // para que cambie la direccion
    }

}
