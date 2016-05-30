import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


public class Table {

	public static void imprimeSelecionados(List<CustomerAccount> lista) {
		Iterator<CustomerAccount> i = lista.iterator();
		System.out.println("Imprimindo objetos selecionados para o cálculo da média.");
		System.out.println("Critérios: vl_total maior que 560 e id_customer entre 1500 e 2700");

		while (i.hasNext()) {
			CustomerAccount c = i.next();
			System.out.print("id_customer: " + c.getId() + " | ");
			System.out.print("cpf_cnpj: " + c.getCpf_cnpj() + " | ");
			System.out.print("name: " + c.getName() + " | ");
			System.out.print("is_active: " + c.isActive() + " | ");
			System.out.println("vl_total: " + c.getValue() );
		}
	}
	
	public static List<CustomerAccount> seleciona(List<CustomerAccount> lista) {
		
		List<CustomerAccount> selecionados = new ArrayList<CustomerAccount>();
		
		for (CustomerAccount customer : lista) {
			if (customer.getValue() > 560.0 && customer.getId() >= 1500 && customer.getId() <= 2700) {
				selecionados.add(customer); 
			}
		}
		return selecionados;
	}
	
	public static void calculaMedia(List<CustomerAccount> lista) {
		
		double mediaFinal = 0;

		for (CustomerAccount customer : lista) {
			mediaFinal += customer.getValue();
		}
		if (!lista.isEmpty()) { // impedir divisão por zero
			mediaFinal /= lista.size();
			System.out.println("\nA média (vl_total) dos objetos selecionados é " + mediaFinal);
		} else {
			System.out.println("Não há objetos nessa lista.");
		}
	}

}
