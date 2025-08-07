using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using Projeto.Models;
using Projeto.Data;

namespace Projeto.Controllers
{
    public class AtletasController : Controller
    {
        private readonly Database db = new Database();

        public IActionResult Criar()

        {

            ViewBag.Cidades = GetCidades(); // Para dropdown 

            return View();
        }
        [HttpPost]

        public IActionResult Criar(Atleta atleta)

        {

            using (var conn = db.GetConnection())

            {

                var sql = @"INSERT INTO atletas (nomeAtleta, dataNascimento, sexo, altura, peso, codCidade) 

                     VALUES (@nome, @data, @sexo, @altura, @peso, @cidade)";

                var cmd = new MySqlCommand(sql, conn);

                cmd.Parameters.AddWithValue("@nome", atleta.NomeAtleta);

                cmd.Parameters.AddWithValue("@data", atleta.DataNascimento);

                cmd.Parameters.AddWithValue("@sexo", atleta.Sexo);

                cmd.Parameters.AddWithValue("@altura", atleta.Altura);

                cmd.Parameters.AddWithValue("@peso", atleta.Peso);

                cmd.Parameters.AddWithValue("@cidade", atleta.CodCidade);

                cmd.ExecuteNonQuery();

            }

            return RedirectToAction("Index");

        }



        private List<Cidade> GetCidades()

        {

            List<Cidade> cidades = new List<Cidade>();

            using (var conn = db.GetConnection())

            {

                var sql = "SELECT Distinct * FROM cidades order by nomeCidade";

                var cmd = new MySqlCommand(sql, conn);

                var reader = cmd.ExecuteReader();

                while (reader.Read())

                {

                    cidades.Add(new Cidade

                    {

                        CodCidade = reader.GetInt32("codCidade"),

                        NomeCidade = reader.GetString("nomeCidade"),

                        CodEstado = reader.GetInt32("codEstado")

                    });

                }

            }

            return cidades;

        }
    }
}
