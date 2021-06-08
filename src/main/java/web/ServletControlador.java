
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

@WebServlet("/ServletControlador")
public class ServletControlador extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Cliente> clientes = new ClienteDaoJDBC().listar();
        System.out.print("Clientes= "+ clientes);
        req.setAttribute("clientes",clientes);
        req.setAttribute("saldoTotal",saldoTotal(clientes));
        req.setAttribute("totalClientes",clientes.size());
        req.getRequestDispatcher("clientes.jsp").forward(req, resp);
    }
    
    private double saldoTotal(List<Cliente> clientes){
        double saldoTotal=0;
        for(Cliente cliente: clientes){
            saldoTotal+= cliente.getSaldo();
        }
        return saldoTotal;
    }
    
    
}
