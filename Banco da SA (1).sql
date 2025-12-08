-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: supermercadosa
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `id` char(36) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `contato` varchar(200) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `cnpj` varchar(18) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
INSERT INTO `fornecedor` VALUES ('3bfbf779-ce38-11f0-8ef2-ac5afcb4f2a7','Supermercado Central','1198765-4321','contato@supercentral.com','Rua das Flores, 123 - Centro','12.345.678/0001-90');
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itemvenda`
--

DROP TABLE IF EXISTS `itemvenda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itemvenda` (
  `id` char(36) NOT NULL,
  `venda_id` char(36) NOT NULL,
  `produto_sku` varchar(50) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_unitario` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `venda_id` (`venda_id`),
  KEY `produto_sku` (`produto_sku`),
  CONSTRAINT `itemvenda_ibfk_1` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`id`),
  CONSTRAINT `itemvenda_ibfk_2` FOREIGN KEY (`produto_sku`) REFERENCES `produto` (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itemvenda`
--

LOCK TABLES `itemvenda` WRITE;
/*!40000 ALTER TABLE `itemvenda` DISABLE KEYS */;
INSERT INTO `itemvenda` VALUES ('cf7dc9e2-cfa7-11f0-b09e-ac5afcb4f2a7','dc074cfe-cf15-11f0-9e7a-ac5afcb4f2a7','001',2,19.90),('cf7e2c19-cfa7-11f0-b09e-ac5afcb4f2a7','dc074cfe-cf15-11f0-9e7a-ac5afcb4f2a7','002',5,7.50);
/*!40000 ALTER TABLE `itemvenda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimentacaoestoque`
--

DROP TABLE IF EXISTS `movimentacaoestoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimentacaoestoque` (
  `id` char(36) NOT NULL,
  `produto_sku` varchar(50) NOT NULL,
  `data` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `quantidade` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `motivo` varchar(255) DEFAULT NULL,
  `fornecedor_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produto_sku` (`produto_sku`),
  KEY `fornecedor_id` (`fornecedor_id`),
  CONSTRAINT `movimentacaoestoque_ibfk_1` FOREIGN KEY (`produto_sku`) REFERENCES `produto` (`sku`),
  CONSTRAINT `movimentacaoestoque_ibfk_2` FOREIGN KEY (`fornecedor_id`) REFERENCES `fornecedor` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimentacaoestoque`
--

LOCK TABLES `movimentacaoestoque` WRITE;
/*!40000 ALTER TABLE `movimentacaoestoque` DISABLE KEYS */;
INSERT INTO `movimentacaoestoque` VALUES ('7dc92e85-cfa3-11f0-b09e-ac5afcb4f2a7','001','2025-12-02 17:22:34',30,'entrada','Reposição via fornecedor','3bfbf779-ce38-11f0-8ef2-ac5afcb4f2a7');
/*!40000 ALTER TABLE `movimentacaoestoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operadorcaixa`
--

DROP TABLE IF EXISTS `operadorcaixa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operadorcaixa` (
  `usuario_id` char(36) NOT NULL,
  `nome` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`),
  CONSTRAINT `operadorcaixa_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operadorcaixa`
--

LOCK TABLES `operadorcaixa` WRITE;
/*!40000 ALTER TABLE `operadorcaixa` DISABLE KEYS */;
INSERT INTO `operadorcaixa` VALUES ('9964a1ed-cf01-11f0-bfc2-ac5afcb4f2a7','Ana Clara');
/*!40000 ALTER TABLE `operadorcaixa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagamento`
--

DROP TABLE IF EXISTS `pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagamento` (
  `id` char(36) NOT NULL,
  `venda_id` char(36) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `venda_id` (`venda_id`),
  CONSTRAINT `pagamento_ibfk_1` FOREIGN KEY (`venda_id`) REFERENCES `venda` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagamento`
--

LOCK TABLES `pagamento` WRITE;
/*!40000 ALTER TABLE `pagamento` DISABLE KEYS */;
INSERT INTO `pagamento` VALUES ('a3263d96-cf18-11f0-9e7a-ac5afcb4f2a7','dc074cfe-cf15-11f0-9e7a-ac5afcb4f2a7',89.50,'crédito','pendente'),('c85b73be-cf18-11f0-9e7a-ac5afcb4f2a7','dc074cfe-cf15-11f0-9e7a-ac5afcb4f2a7',89.50,'crédito','pendente');
/*!40000 ALTER TABLE `pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parcela`
--

DROP TABLE IF EXISTS `parcela`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parcela` (
  `id` char(36) NOT NULL,
  `pagamento_id` char(36) NOT NULL,
  `numero` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `vencimento` date NOT NULL,
  `status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pagamento_id` (`pagamento_id`),
  CONSTRAINT `parcela_ibfk_1` FOREIGN KEY (`pagamento_id`) REFERENCES `pagamento` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parcela`
--

LOCK TABLES `parcela` WRITE;
/*!40000 ALTER TABLE `parcela` DISABLE KEYS */;
INSERT INTO `parcela` VALUES ('','a3263d96-cf18-11f0-9e7a-ac5afcb4f2a7',1,0.00,'2025-03-10','pendente'),('0d7ca74f-cf19-11f0-9e7a-ac5afcb4f2a7','a3263d96-cf18-11f0-9e7a-ac5afcb4f2a7',1,29.83,'2025-03-10','pendente'),('0d7da3ce-cf19-11f0-9e7a-ac5afcb4f2a7','a3263d96-cf18-11f0-9e7a-ac5afcb4f2a7',2,29.83,'2025-04-10','pendente'),('0d7da4e4-cf19-11f0-9e7a-ac5afcb4f2a7','a3263d96-cf18-11f0-9e7a-ac5afcb4f2a7',3,29.84,'2025-05-10','pendente'),('fe7827bf-cf18-11f0-9e7a-ac5afcb4f2a7','a3263d96-cf18-11f0-9e7a-ac5afcb4f2a7',1,89.50,'2025-03-10','pendente');
/*!40000 ALTER TABLE `parcela` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `sku` varchar(50) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `estoque_atual` int(11) NOT NULL,
  `estoque_minimo` int(11) NOT NULL,
  `exige_idade` tinyint(1) NOT NULL,
  PRIMARY KEY (`sku`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES ('001','Arroz 5kg','Pacote de arroz 5kg tipo 1',19.90,50,5,0),('002','Feijão 1kg','Feijão carioca 1kg',7.50,30,5,0),('789','Macarrão 500g','Macarrão espaguete 500g',4.20,100,10,0);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisor`
--

DROP TABLE IF EXISTS `supervisor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supervisor` (
  `usuario_id` char(36) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`),
  CONSTRAINT `supervisor_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisor`
--

LOCK TABLES `supervisor` WRITE;
/*!40000 ALTER TABLE `supervisor` DISABLE KEYS */;
INSERT INTO `supervisor` VALUES ('b4c70a69-cf12-11f0-9e7a-ac5afcb4f2a7','Fernando Machado','1198765-4321','fernando.machado@empresa.com');
/*!40000 ALTER TABLE `supervisor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id` char(36) NOT NULL DEFAULT uuid(),
  `nome` varchar(100) NOT NULL,
  `contato` varchar(50) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('9964a1ed-cf01-11f0-bfc2-ac5afcb4f2a7','Ana Clara','472367-8888','contato@anaclara.com','Rua das Tropa, 123 - Brejo'),('b4c70a69-cf12-11f0-9e7a-ac5afcb4f2a7','Roanldo Juan','472456-8888','contato@ronaldojuan.com','Rua das correia, 123 - Brejo');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venda` (
  `id` char(36) NOT NULL,
  `data_hora` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `total` decimal(10,2) NOT NULL,
  `status` varchar(20) NOT NULL,
  `caixa_rapido` tinyint(1) NOT NULL,
  `caixa_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES ('dc074cfe-cf15-11f0-9e7a-ac5afcb4f2a7','2025-02-10 17:32:00',89.50,'concluída',0,'11111111-2222-3333-4444-555555555555'),('dc07d077-cf15-11f0-9e7a-ac5afcb4f2a7','2025-02-10 18:10:00',152.75,'pendente',1,'11111111-2222-3333-4444-555555555555');
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-02 15:09:14
