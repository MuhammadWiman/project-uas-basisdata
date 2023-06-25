const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

exports.postData = async (req, res) => {
  try {
    await prisma.$queryRawUnsafe(`
        INSERT INTO pemesanan_uas_muhammadwiman
            VALUES (
            '${req.body.no_penerbangan}',
            '${req.body.no_ktp}',
            '${req.body.maskapai}',
            '${req.body.kelas}',
            '${req.body.kota_asal}',
            '${req.body.kota_tujuan}',
            '${req.body.tanggal}',
            '${req.body.pukul}',
            '${req.body.harga_tiket}')
        `);
    res.json({
      pesan: "data berhasil Masuk",
    });
  } catch (error) {
    res.json({
      pesan: "data gagal Masuk",
    });
  }
};

exports.showData = async (req, res) => {
  try {
    let show = await prisma.$queryRawUnsafe(`
          SELECT * FROM pemesanan_uas_muhammadwiman`);
    res.json({
      pesan: "Berhasil Menampilkan data",
      data: show,
    });
  } catch (error) {
    res.json({
      pesan: "Gagal Menampilkan data",
    });
  }
};

exports.showDataByID = async (req, res) => {
  try {
    let show = await prisma.$queryRawUnsafe(
      `SELECT * FROM pemesanan_uas_muhammadwiman WHERE no_penerbangan = ${req.params.id}`
    );
    res.json({
      pesan: "Berhasil Menampilkan data",
      data: show,
    });
  } catch (error) {
    res.json({
      pesan: "Gagal Menampilkan data",
    });
  }
};

exports.updateDataByID = async (req, res) => {
  try {
    let update = await prisma.$queryRawUnsafe(`
        UPDATE pemesanan_uas_muhammadwiman
            SET 
            maskapai = 
            '${req.body.maskapai}',
            kelas =
            '${req.body.kelas}',
            kota_asal =
            '${req.body.kota_asal}',
            kota_tujuan =
            '${req.body.kota_tujuan}',
            tanggal_keberangkatan =
            '${req.body.tanggal}',
            pukul =
            '${req.body.pukul}',
            harga_tiket =
            '${req.body.harga_tiket}'
        WHERE no_penerbangan= ${req.params.id}`);
    res.json({
      pesan: "Berhasil mengubah data",
    });
  } catch (error) {
    res.json({
      pesan: "Gagal Mengubah data",
    });
  }
};

exports.deleteDataByID = async (req, res) => {
  try {
    let update = await prisma.$queryRawUnsafe(`
        DELETE FROM pemesanan_uas_muhammadwiman
        WHERE no_penerbangan= ${req.params.id}`);
    res.json({
      pesan: "Berhasil mennghapus data",
    });
  } catch (error) {
    res.json({
      pesan: "Gagal Menghapus data",
    });
  }
};
