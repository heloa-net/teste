import java.util.ArrayList;
import java.util.Collections;
import java.util.List;


public class Teste {

	public static void main(String[] args) {

		List<CustomerAccount> tabela = new ArrayList<CustomerAccount>();

		CustomerAccount c1 = new CustomerAccount(2007, "35621485268", "José Felipe Martins", true, 590.9);
		CustomerAccount c2 = new CustomerAccount(1950, "47821485297", "Maria Alice Barros", true, 700.0);
		CustomerAccount c3 = new CustomerAccount(850, "25521485858", "Carlos", true, 750);
		CustomerAccount c4 = new CustomerAccount(2150, "32412587548", "Gev Alison", true, 400.0);

		tabela.add(c1);
		tabela.add(c2);
		tabela.add(c3);
		tabela.add(c4);

		List<CustomerAccount> selecionados = new ArrayList<CustomerAccount>();		
		
		selecionados = Table.seleciona(tabela);
		Collections.sort(selecionados);
		Table.imprimeSelecionados(selecionados);
		Table.calculaMedia(selecionados);		
	}
}
