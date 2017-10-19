
import java.awt.Color;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.geom.Ellipse2D;
import java.awt.geom.Line2D;
import javax.swing.JPanel;

public class PicturePanel extends JPanel {
  private static final double DIAMETER_OF_DOT = 0.04;

  public PicturePanel() {
    this.setBackground( Color.CYAN );
    this.setForeground( Color.RED );
  } // PicturePanel()

  public void paintComponent( Graphics g ) {
    super.paintComponent( g );
    Graphics2D g2D = (Graphics2D) g;

    int w = this.getWidth();
    int h = this.getHeight();

    AffineTransform scale = new AffineTransform();
    scale.setToScale( w/2, h/2 );

    AffineTransform translate = new AffineTransform();
    translate.setToTranslation( 1.0, 1.0 );

    AffineTransform transform = new AffineTransform();
    transform.concatenate( scale );
    transform.concatenate( translate );

    int numberOfPoints = 3;
    double radius = 2.0/(1.0 + Math.sqrt(5.0));

    double [] x = new double[numberOfPoints];
    double [] y = new double[numberOfPoints];

    Vertex [] vertices = new Vertex[numberOfPoints];


    for( int i = 0; i < numberOfPoints; i++ ) {
      double fraction = ((double) i)/numberOfPoints;

      double angle = fraction * 2.0 * Math.PI;

      x[i] = radius * Math.cos( angle );
      y[i] = radius * Math.sin( angle );

      vertices[i] = new Vertex( x[i], y[i] );
    } // for

    Triangle striangle = new Triangle(vertices[0], vertices[1], vertices[0]);
    Triangle midtriangle = new Triangle(striangle.getmid1(), striangle.getmid2(), striangle.getmid0());
    //while(striangle.len() > .1){


    //}
    Ellipse2D dot0 = createDot( midtriangle.fe() );
    g2D.fill( transform.createTransformedShape(dot0) );

    Ellipse2D dot1 = createDot( midtriangle.se() );
    g2D.fill( transform.createTransformedShape(dot1) );

    Ellipse2D dot2 = createDot( midtriangle.te() );
    g2D.fill( transform.createTransformedShape(dot2) );

    for( int i = 0; i < numberOfPoints; i++ ) {
      Ellipse2D dot = createDot( vertices[i] );
      g2D.fill( transform.createTransformedShape(dot) );
    } // for

    Edge [] edges = new Edge[numberOfPoints];
    for( int i = 0; i < numberOfPoints - 1; i++ ) {
      edges[i] = new Edge( vertices[i], vertices[i + 1] );
    } // for
    edges[numberOfPoints - 1] = new Edge( vertices[numberOfPoints - 1], vertices[0] );

    for( int i = 0; i < numberOfPoints; i++ ) {
      Line2D segment = createLineSegment( edges[i] );
      g2D.draw( transform.createTransformedShape( segment ) );
    } // for

  } // paintComponent( Graphics )

  private Ellipse2D createDot( Vertex v ) {
    double centerX=  v.getX();
    double centerY = v.getY();

    double diameter = DIAMETER_OF_DOT;

    double ulx = centerX - diameter/2;
    double uly = centerY - diameter/2;

    Ellipse2D circle = new Ellipse2D.Double( ulx, uly, diameter, diameter );

    return circle;
  } // createDot( Vertex )

  private Line2D createLineSegment( Edge e ) {
    double x0 = e.getV0().getX();
    double y0 = e.getV0().getY();
    double x1 = e.getV1().getX();
    double y1 = e.getV1().getY();

    Line2D segment = new Line2D.Double( x0, y0, x1, y1 );

    return segment;
  }// createLineSegment( Edge )
  public static void main( String [] args ) {
    System.out.println("da");


  }

} // PicturePanel
