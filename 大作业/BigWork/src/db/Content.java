package db;
public class Content {
	private String content;
	private String []news = new String[50];
	private int []id = new int[100];
	private String[]usersname = new String[100];
	private String[]pwd = new String[100];
	private int usersnum;
	private String username;
	private String userpwd;
	ConnectDB conn = new ConnectDB();
	public Content() {
	}
	public void lanmu(String name ,String id) {
		conn.ConnectDBlanmu(name,id);
		this.content = conn.getcontent();
	}
	public void news(String name , String id,String content) {
		conn.ConnectDBnews(name, id,content);
		this.news = conn.getnews();
	}
	public void users() {
		conn.ConnectDBusers();
		this.usersname = conn.getusersname();
		this.id = conn.getid();
		this.pwd = conn.getpwd();
		this.usersnum = conn.getusersnum();
	}
	public void user(String uid) {
		conn.ConnectDBuser(uid);
		this.username = conn.getusername();
		this.userpwd = conn.getuserpwd();
	}
	public String getcontent() {
		return this.content;
	}
	public String[] getnews() {
		System.out.println(news[2]);
		return this.news;
	}
	public String[] getusersname(){
		return this.usersname;
	}
	public int[] getid() {
		return this.id;
	}
	public String[] getpwd() {
		return this.pwd;
	}
	public int getusersnum() {
		return this.usersnum;
	}
	public String getuserpwd() {
		return this.userpwd;
	}
	public String getusername() {
		return this.username;
	}
}
