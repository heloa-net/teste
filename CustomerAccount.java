public class CustomerAccount implements Comparable<CustomerAccount> {

	private int id; // id_customer
	private String cpf_cnpj; //cpf_cnpj
	private String name; // name
	private boolean isActive; // is_active
	private double value; // vl_total

	public CustomerAccount(int id, String cpf_cnpj, String name, boolean isActive, double value) {

		this.setId(id);
		this.setCpf_cnpj(cpf_cnpj);
		this.setName(name);
		this.setActive(isActive);
		this.setValue(value);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCpf_cnpj() {
		return cpf_cnpj;
	}

	public void setCpf_cnpj(String cpf_cnpj) {
		this.cpf_cnpj = cpf_cnpj;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public double getValue() {
		return value;
	}

	public void setValue(double value) {
		this.value = value;
	}


	public int compareTo(CustomerAccount another) {
		if (this.value < another.value) {
			return -1;
		}

		if (this.value > another.value) {
			return 1;
		}
		return 0;
	}
}
