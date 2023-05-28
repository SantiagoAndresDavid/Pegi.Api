using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;

namespace Automation;

public class authProfessor
{
    private IWebDriver driver;

    [SetUp]
    public void Setup()
    {
         driver = new ChromeDriver();
    }

    [Test]
    public void LoginProfessor()
    {
        ChromeOptions options = new ChromeOptions();
        options.AddArgument("--allow-insecure-localhost");
        driver.Navigate().GoToUrl("https://pegi.vercel.app/");
        driver.Manage().Window.Maximize();
        Thread.Sleep(9000);
        var loginButton = driver.FindElement(By.Id("login"));
        loginButton.Click();
        Thread.Sleep(2000);
        var userName = driver.FindElement(By.Name("user"));
        userName.SendKeys("maribel");
        Thread.Sleep(2500);
        var password = driver.FindElement(By.Name("password"));
        password.SendKeys("maribel");
        Thread.Sleep(2500);
        var sendButton = driver.FindElement(By.Id("send"));
        sendButton.Click();
        Thread.Sleep(4000);

        //enter data to a cv
        var dashButton = driver.FindElement((By.Id("dashboard")));
        dashButton.Click();
        Thread.Sleep(2500);
        //enter data to a cv
        var cvButton = driver.FindElement((By.Id("cv")));
        cvButton.Click();
        Thread.Sleep(2500);
        var consultProposalButton = driver.FindElement((By.Id("proposal-repository")));
        consultProposalButton.Click();
        Thread.Sleep(2500);
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
        var qualifyButton = driver.FindElement((By.Id("qualify")));
        qualifyButton.Click();
        Thread.Sleep(2500);
        var closeQualifyButton = driver.FindElement((By.Id("closeQualify")));
        closeQualifyButton.Click();
        Thread.Sleep(5500);
        driver.Close();

        Assert.Pass();
    }

}
