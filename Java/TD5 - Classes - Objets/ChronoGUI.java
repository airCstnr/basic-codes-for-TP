import java.awt.BorderLayout;
import java.awt.CardLayout;
import java.awt.FlowLayout;
import java.awt.Font;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.SwingConstants;


public class ChronoGUI extends JFrame {
	
	private static final int DEF_H = 0, DEF_MIN = 0, DEF_SEC = 5;
	
	private Chrono1 chrono;
	private JButton startBtn, stopBtn, resetBtn;
	private JLabel compteurLbl;
	
	
	
	public ChronoGUI() {
		super("Super Chronomètre !");
		this.setDefaultCloseOperation(EXIT_ON_CLOSE);
		this.setLocationRelativeTo(null);
		this.setSize(500,250);
		
		JPanel bodyPnl    = new JPanel(new BorderLayout());
		JPanel buttonsPnl = new JPanel(new FlowLayout());
		
		startBtn = new JButton("Start");
		stopBtn  = new JButton("Stop");
		resetBtn = new JButton("Reset");
		
		startBtn.addActionListener((e)->{chrono.startRebours();});
		stopBtn .addActionListener((e)->{chrono.stopRebours();});
		resetBtn.addActionListener((e)->{chrono.init(DEF_H,DEF_MIN,DEF_SEC);});
	
		buttonsPnl.add(startBtn);
		buttonsPnl.add(stopBtn);
		buttonsPnl.add(resetBtn);
		
		bodyPnl.add(buttonsPnl, BorderLayout.SOUTH);
		
		this.setContentPane(bodyPnl);
		
		chrono = new Chrono1(DEF_H, DEF_MIN, DEF_SEC);
		compteurLbl = new JLabel(chrono.toString());
		compteurLbl.setHorizontalAlignment(SwingConstants.CENTER);
		
		compteurLbl.setFont(compteurLbl.getFont().deriveFont(30f));
		
		bodyPnl.add(compteurLbl, BorderLayout.CENTER);
		
		this.setVisible(true);
		
		new Thread(()->{
			while(true) {
				compteurLbl.setText(chrono.toString());
				try {
					Thread.sleep(100);
				} catch (Exception e) {}
				
			}
		}).start();
	}
}
