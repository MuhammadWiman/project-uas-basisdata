const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

exports.postData = async (req, res) => {
  try {
    await prisma.$queryRawUnsafe(`
        INSERT INTO kota_uas_muhammadwiman
            VALUES (null,
            '${req.body.kode_kota}',
            '${req.body.nama_kota}',
            '${req.body.bandara}')
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
          SELECT * FROM kota_uas_muhammadwiman`);
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
    let show = await prisma.$queryRawUnsafe(`
        SELECT * FROM kota_uas_muhammadwiman  WHERE kode_kota = '${req.params.id}'`);
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
        UPDATE kota_uas_muhammadwiman
            SET
            nama_kota = 
            '${req.body.nama_kota}',
            bandara =
            '${req.body.bandara}'
        WHERE id= ${req.params.id}`);
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
        DELETE FROM kota_uas_muhammadwiman
        WHERE id= ${req.params.id}`);
    res.json({
      pesan: "Berhasil mennghapus data",
    });
  } catch (error) {
    res.json({
      pesan: "Gagal Menghapus data",
    });
  }
};
