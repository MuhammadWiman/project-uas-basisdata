const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

exports.postData = async (req, res) => {
  try {
    await prisma.$queryRawUnsafe(`
        INSERT INTO pelanggan_uas_muhammadwiman
            VALUES (
            '${req.body.no_ktp}',
            '${req.body.nama}',
            '${req.body.alamat}',
            '${req.body.no_telp}',
            '${req.body.jenis_kelamin}')
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
          SELECT * FROM pelanggan_uas_muhammadwiman`);
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
        SELECT * FROM pelanggan_uas_muhammadwiman  WHERE no_ktp= ${req.params.id}`);
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
        UPDATE pelanggan_uas_muhammadwiman
            SET 
            nama = 
            '${req.body.nama}',
            alamat =
            '${req.body.alamat}',
            no_telp =
            '${req.body.no_telp}',
            jenis_kelamin =
            '${req.body.jenis_kelamin}'
        WHERE no_ktp= ${req.params.id}`);
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
        DELETE FROM pelanggan_uas_muhammadwiman
        WHERE no_ktp= ${req.params.id}`);
    res.json({
      pesan: "Berhasil mennghapus data",
    });
  } catch (error) {
    res.json({
      pesan: "Gagal Menghapus data",
    });
  }
};
