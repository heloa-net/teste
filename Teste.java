import java.util.ArrayList;
<<<<<<< HEAD
import java.util.Collections;
=======
>>>>>>> ac16cb7955bea5e226a6017b2dd6c3183d6601ae
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
<<<<<<< HEAD
		Collections.sort(selecionados);
=======
>>>>>>> ac16cb7955bea5e226a6017b2dd6c3183d6601ae
		Table.imprimeSelecionados(selecionados);
		Table.calculaMedia(selecionados);		
	}
}
