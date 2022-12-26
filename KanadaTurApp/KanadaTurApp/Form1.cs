using System;
using Npgsql;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace KanadaTurApp
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void groupBox2_Enter(object sender, EventArgs e)
        {

        }

        private void groupBox3_Enter(object sender, EventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btnOda101_Click(object sender, EventArgs e)
        {
            txtOdaNo.Text = "101";

        }

        private void btnOda102_Click(object sender, EventArgs e)
        {
            txtOdaNo.Text = "102";
        }

        private void btnOda103_Click(object sender, EventArgs e)
        {
            txtOdaNo.Text = "103";
        }

        private void btnOda104_Click(object sender, EventArgs e)
        {
            txtOdaNo.Text = "104";
        }

        private void btnOda105_Click(object sender, EventArgs e)
        {
            txtOdaNo.Text = "105";
        }

        private void btnOda106_Click(object sender, EventArgs e)
        {
            txtOdaNo.Text = "106";
        }

        private void btnOda107_Click(object sender, EventArgs e)
        {
            txtOdaNo.Text = "107";
        }

        private void btnOda108_Click(object sender, EventArgs e)
        {
            txtOdaNo.Text = "108";
        }

        private void btnOda109_Click(object sender, EventArgs e)
        {
            txtOdaNo.Text = "109";
        }

        private void btnUcak16_Click(object sender, EventArgs e)
        {
            txtUcakBileti.Text = "16";
        }

        private void btnUcak15_Click(object sender, EventArgs e)
        {
            txtUcakBileti.Text = "15";
        }

        private void btnUcak14_Click(object sender, EventArgs e)
        {
            txtUcakBileti.Text = "14";
        }

        private void btnUcak13_Click(object sender, EventArgs e)
        {
            txtUcakBileti.Text = "13";
        }

        private void btnUcak11_Click(object sender, EventArgs e)
        {
            txtUcakBileti.Text = "11";
        }

        private void btnUcak10_Click(object sender, EventArgs e)
        {
            txtUcakBileti.Text = "10";
        }

        private void btnUcak6_Click(object sender, EventArgs e)
        {
            txtUcakBileti.Text = "6";
        }

        private void btnUcak5_Click(object sender, EventArgs e)
        {
            txtUcakBileti.Text = "5";
        }

        private void btnUcak1_Click(object sender, EventArgs e)
        {
            txtUcakBileti.Text = "1";
        }

        private void btnOdaDolu_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Kırmızı renkli otel odaları doludur.");
        }

        private void btnOdaBos_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Yeşil renkli otel odaları boştur.");
        }

        private void btnUcakDolu_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Kırmızı renkli uçak koltuk numaraları doludur.");
        }

        private void btnUcakBos_Click(object sender, EventArgs e)
        {
            MessageBox.Show("Yeşil renkli uçak koltuk numaraları boştur.");
        }

        private void btnKaydet_Click(object sender, EventArgs e)
        {

        }

        private void lblUcret_Click(object sender, EventArgs e)
        {
            
        }

        private void cmbBoxSure_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        private void rchTxtBoxUcret_TextChanged(object sender, EventArgs e)
        {
            
        }

        NpgsqlConnection baglanti = new NpgsqlConnection("server=localHost; port=5432; Database=kanada_tur; user ID=postgres; password=12345");
        private void btnListele_Click(object sender, EventArgs e)
        {
            string sorgu = "SELECT * FROM musteri";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }

        private void btnEkle_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut1 = new NpgsqlCommand("INSERT INTO musteri(mst_id, mst_adsoyad, mst_turid, mst_tcno, mst_tel, mst_odano, mst_ucak, mst_cinsiyet) VALUES (@p1, @p2,@p3,@p4,@p5,@p6,@p7,@p8)", baglanti);
            komut1.Parameters.AddWithValue("@p1", int.Parse(txtBoxMusteriid.Text));
            komut1.Parameters.AddWithValue("@p2", txtAdiSoyadi.Text);
            komut1.Parameters.AddWithValue("@p3", int.Parse(txtBoxTurid.Text));
            komut1.Parameters.AddWithValue("@p4", long.Parse( txtTC.Text));
            komut1.Parameters.AddWithValue("@p5", MskTxtTel.Text);
            komut1.Parameters.AddWithValue("@p6", int.Parse(txtOdaNo.Text));
            komut1.Parameters.AddWithValue("@p7", int.Parse(txtUcakBileti.Text));
            komut1.Parameters.AddWithValue("@p8", cmbBoxCinsiyet.Text);
            komut1.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Musteri ekleme islemi basarili!", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);
        }

        private void Form1_Load(object sender, EventArgs e)
        {
                            
        }

        private void btnSİl_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut2 = new NpgsqlCommand("DELETE FROM musteri WHERE mst_id=@p1", baglanti);
            komut2.Parameters.AddWithValue("@p1", int.Parse(txtBoxMusteriid.Text));
            komut2.ExecuteNonQuery();
            baglanti.Close();
            MessageBox.Show("Müşteri silinmiştir!", "Bilgi", MessageBoxButtons.YesNo, MessageBoxIcon.Stop );
        }

        private void btnGuncelle_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut3 = new NpgsqlCommand("UPDATE musteri SET mst_adsoyad=@p2, mst_turid=@p3, mst_tcno=@p4, mst_tel=@p5, mst_ucak=@p7, mst_cinsiyet=@p8, mst_odano=@p9 WHERE mst_id=@p6", baglanti);
            komut3.Parameters.AddWithValue("@p2", txtAdiSoyadi.Text);
            komut3.Parameters.AddWithValue("@p3", int.Parse(txtBoxTurid.Text));
            komut3.Parameters.AddWithValue("@p4", long.Parse(txtTC.Text));
            komut3.Parameters.AddWithValue("@p5", MskTxtTel.Text);
            komut3.Parameters.AddWithValue("@p6", int.Parse(txtBoxMusteriid.Text));
            komut3.Parameters.AddWithValue("@p7", int.Parse(txtUcakBileti.Text));
            komut3.Parameters.AddWithValue("@p8", cmbBoxCinsiyet.Text);
            komut3.Parameters.AddWithValue("@p9", int.Parse(txtOdaNo.Text));
            komut3.ExecuteNonQuery();
            MessageBox.Show("Müşteri güncellendi!", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            baglanti.Close();
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            

            

        }

        private void btnAra_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            //NpgsqlCommand komut4 = new NpgsqlCommand("SELECT * FROM musteri WHERE mst_id::text LIKE '%" + txtBoxMusteriid.Text + "%' OR mst_adsoyad LIKE '%" + txtAdiSoyadi.Text + "%'", baglanti);
            NpgsqlCommand komut4 = new NpgsqlCommand("SELECT * FROM musteri WHERE mst_id::text LIKE '%" + txtBoxMusteriid.Text + "%'", baglanti);
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(komut4);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
            baglanti.Close();
        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            int secilialan = dataGridView1.SelectedCells[0].RowIndex;
            string mst_adsoyad = dataGridView1.Rows[secilialan].Cells[1].Value.ToString();
            string mst_cinsiyet = dataGridView1.Rows[secilialan].Cells[2].Value.ToString();
            string mst_turid = dataGridView1.Rows[secilialan].Cells[3].Value.ToString();
            string mst_tcno = dataGridView1.Rows[secilialan].Cells[6].Value.ToString();
            string mst_ucak = dataGridView1.Rows[secilialan].Cells[5].Value.ToString();
            string mst_tel = dataGridView1.Rows[secilialan].Cells[7].Value.ToString();
            string mst_odano = dataGridView1.Rows[secilialan].Cells[4].Value.ToString();

            txtAdiSoyadi.Text = mst_adsoyad;
            txtBoxTurid.Text = mst_turid;
            txtTC.Text = mst_tcno;
            MskTxtTel.Text = mst_tel;
            txtUcakBileti.Text = mst_ucak;
            txtOdaNo.Text = mst_odano;
            cmbBoxCinsiyet.Text=mst_cinsiyet;
        }
    }
}
