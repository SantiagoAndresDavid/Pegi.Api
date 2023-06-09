using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;

namespace Automation;

public class auth
{
    private IWebDriver driver;

    [SetUp]
    public void Setup()
    {
         driver = new ChromeDriver();
    }

    [Test]
    public void Login()
    {
        ChromeOptions options = new ChromeOptions();
        options.AddArgument("--allow-insecure-localhost");
        driver.Navigate().GoToUrl("https://pegi-web.vercel.app/");
        driver.Manage().Window.Maximize();
        Thread.Sleep(18000);
        var loginButton = driver.FindElement(By.Id("login"));
        loginButton.Click();
        Thread.Sleep(2000);
        var userName = driver.FindElement(By.Name("user"));
        userName.SendKeys("anap");
        Thread.Sleep(2500);
        var password = driver.FindElement(By.Name("password"));
        password.SendKeys("anap");
        Thread.Sleep(2500);
        var sendButton = driver.FindElement(By.Id("send"));
        sendButton.Click();
        Thread.Sleep(4000);
        //enter to a dashboard
        var dashButton = driver.FindElement((By.Id("dashboard")));
        dashButton.Click();
        Thread.Sleep(8000);
        //enter  to a cv
        var cvButton = driver.FindElement((By.Id("cv")));
        cvButton.Click();
        Thread.Sleep(5000);
        //enter  to a table of proposals
        var consultProposalButton = driver.FindElement((By.Id("table-of-proposals")));
        consultProposalButton.Click();
        Thread.Sleep(5000);
        var viewProposalButton = driver.FindElement((By.Id("details")));
        viewProposalButton.Click();
        Thread.Sleep(5500);
        var closeviewButton = driver.FindElement((By.Id("closeDetails")));
        closeviewButton.Click();
        Thread.Sleep(2500);
        var historyProposalButton = driver.FindElement((By.Id("history")));
        historyProposalButton.Click();
        Thread.Sleep(5500);
        var closeHistoryButton = driver.FindElement((By.Id("closeHistory")));
        closeHistoryButton.Click();
        Thread.Sleep(2500);
        //enter  option
        var isOpen = driver.FindElement((By.Id("react-aria-5")));
        isOpen.Click();
        Thread.Sleep(2500);
        //enter  option logout
        var logout = driver.FindElement(By.XPath("//li[@data-key='logout']"));
        logout.Click();
        Thread.Sleep(12000);

        driver.Close();

        Assert.Pass();
    }

     public void RegisterProposal()
    {
        ChromeOptions options = new ChromeOptions();
        options.AddArgument("--allow-insecure-localhost");
        driver.Navigate().GoToUrl("https://pegi-web.vercel.app/");
        driver.Manage().Window.Maximize();
        Thread.Sleep(18000);
        var loginButton = driver.FindElement(By.Id("login"));
        loginButton.Click();
        Thread.Sleep(2000);
        var userName = driver.FindElement(By.Name("user"));
        userName.SendKeys("anap");
        Thread.Sleep(2500);
        var password = driver.FindElement(By.Name("password"));
        password.SendKeys("anap");
        Thread.Sleep(2500);
        var sendButton = driver.FindElement(By.Id("send"));
        sendButton.Click();
        Thread.Sleep(4000);
        //enter to a dashboard
        var dashButton = driver.FindElement((By.Id("dashboard")));
        dashButton.Click();
        Thread.Sleep(5000);
        var title = driver.FindElement(By.Name("title"));
        title.SendKeys("Pruebas basadas en hilos caso 2");
        Thread.Sleep(2500);
        var personDocument = driver.FindElement(By.Name("personDocument"));
        personDocument.SendKeys("1067590360");
        Thread.Sleep(2500);
        //lineas de investigacion
        var investigationGroup = driver.FindElement(By.Name("investigationGroup"));
        investigationGroup.SendKeys("esto es un grupo de investigacion");
        Thread.Sleep(2500);
        var approach = driver.FindElement(By.Name("approach"));
        approach.SendKeys("esto es un planteamiento");
        Thread.Sleep(2500);
        var justification = driver.FindElement(By.Name("justification"));
        justification.SendKeys("esto es una justificacion");
        Thread.Sleep(2500);
        var generalObjective = driver.FindElement(By.Name("generalObjective"));
        generalObjective.SendKeys("esto es un objetivo general");
        Thread.Sleep(2500);
        var specificObjective = driver.FindElement(By.Name("specificObjective"));
        specificObjective.SendKeys("Esto es una objetivo especifico");
        Thread.Sleep(2500);
        var bibliographical = driver.FindElement(By.Name("bibliographical"));
        specificObjective.SendKeys("Esto es una bibliografica");
        Thread.Sleep(2500);
        //enter  option
        var isOpen = driver.FindElement((By.Id("react-aria-5")));
        isOpen.Click();
        Thread.Sleep(2500);
        //enter  option logout
        var logout = driver.FindElement(By.XPath("//li[@data-key='logout']"));
        logout.Click();
        Thread.Sleep(12000);

        driver.Close();

        Assert.Pass();
    }

}
