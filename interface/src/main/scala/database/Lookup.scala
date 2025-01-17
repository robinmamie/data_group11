package database

import database.Parameters.Result

object Lookup {

  def allAttributes(toSearch: String): List[Result] = {
    allAttributes(toSearch, Parameters.tableNames)
  }

  def allAttributes(toSearch: String, tables: List[String]): List[Result] = {
    Parameters.tables filter {case (t, _) => tables contains t } map { case(t, a) =>
      val sb = new StringBuilder
      val pa = Parameters.getPrimaryAttributes(t)
      if (pa == Nil)
        sb ++= s"SELECT ${a.head} FROM ${t} WHERE"
      else
        sb ++= s"SELECT ${pa.head} FROM ${t} WHERE"
      for (i <- a) sb ++= s" ${i} LIKE '%${toSearch}%' OR"
      DatabaseLink.fetch(sb.toString.dropRight(3), true, -1)
    }
  }

}
